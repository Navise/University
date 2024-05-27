set ns [new Simulator]
set na [open Lab4.nam w]
$ns namtrace-all-wireless $na 500 500
set nt [open Lab4.tr w]
$ns trace-all $nt

set topo [new Topography]
$topo load_flatgrid 500 500

$ns node-config -adhocRouting DSDV
$ns node-config -llType LL
$ns node-config -macType Mac/802_11
$ns node-config -ifqType Queue/DropTail
$ns node-config -ifqLen 50
$ns node-config -phyType Phy/WirelessPhy
$ns node-config -channelType Channel/WirelessChannel
$ns node-config -propType Propagation/TwoRayGround
$ns node-config -antType Antenna/OmniAntenna
$ns node-config -topoInstance $topo
$ns node-config -agentTrace ON
$ns node-config -routerTrace ON
create-god 2

set n0 [$ns node]
set n1 [$ns node]
$n0 set X_ 250.0
$n0 set Y_ 250.0
$n0 set Z_ 0.0
$n1 set X_ 200.0
$n1 set Y_ 250.0
$n1 set Z_ 0.0
$ns at 0.0 "$n0 setdest 400.0 300.0 50.0"
$ns at 0.0 "$n1 setdest 50.0 100.0 20.0"

set tcp1 [new Agent/TCP]
$ns attach-agent $n0 $tcp1
set sink1 [new Agent/TCPSink]
$ns attach-agent $n1 $sink1
set cbr1 [new Application/Traffic/CBR]
$cbr1 attach-agent $tcp1
$ns connect $tcp1 $sink1

proc End {} {
global ns nt na
$ns flush-trace
close $na
close $nt
exec nam Lab4.nam &
exec echo "number of packets received is" &
exec grep -c "^r" Lab4.tr &
exec echo "number of packets sent is" &
exec grep -c "^s" Lab4.tr &
exec echo "number of packets dropped are" &
exec grep -c "^D" Lab4.tr &
exit 0
}
$ns at 0.0 "$cbr1 start"
$ns at 5.0 "End"
$ns run