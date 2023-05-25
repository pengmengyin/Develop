import PyPDF2
import os
from docx2pdf import convert
def pdf2text(path):
    str = ''
    # Open the PDF file in read-binary mode
    with open(path, 'rb') as pdf_file:

        # Create a PdfReader object
        pdf_reader = PyPDF2.PdfReader(pdf_file)

        # Get the number of pages in the PDF file
        num_pages = len(pdf_reader.pages)

        # Loop through each page and extract the text
        for page_num in range(num_pages):
            # Get the page object
            page_obj = pdf_reader.pages[page_num]

            # Extract the text from the page object
            page_text = page_obj.extract_text()
            #字符串拼接
            str = str + page_text
            # Do something with the text
            # ...

    pdf_file.close()
    return str.replace('\n', '')

# 定义 DOCX 文件所在的文件夹路径
folder_path = "./CV"

# 获取文件夹中所有的 DOCX 文件路径
docx_files = [os.path.join(folder_path, f) for f in os.listdir(folder_path) if f.endswith('.docx')]
str = ''
# 遍历文件列表并将每个文件转换为 PDF 格式
for docx_file in docx_files:
    try:
        new_file_name = docx_file.replace("CV", "pdf").replace("docx", "pdf")

        # 将 DOCX 文件转换为 PDF 文件，并保存到与 DOCX 文件相同的路径下
        convert(docx_file, './pdf/')
        str = str + pdf2text(new_file_name)
        str = str + os.linesep+ os.linesep
        os.remove(new_file_name)
    except Exception as e:
        print(e)
with open("output.txt", "w") as f:
    f.write(str)
