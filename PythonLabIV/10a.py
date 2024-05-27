import PyPDF2

pdf_files = [
    {"filename": 'file1.pdf' , 'page':[0 , 2]},
    {"filename": 'file2.pdf' , 'page':[1]}
]

op = 'combined.pdf'

def combine(inp , out):
    pdfwriter = PyPDF2.PdfWriter()

    for pdfinfo in inp:
        filename = pdfinfo['filename']
        selected = pdfinfo['page']

        with open(filename , 'rb') as pdffile:
            pdfreader = PyPDF2.PdfReader(pdffile)
            for pn in selected:
                page = pdfreader.pages[pn]
                pdfwriter.add_page(page)

    with open(out , 'wb') as opdf:
        pdfwriter.write(out)
    
    print("PDF is combined with selected pages ")
combine(pdf_files , op)