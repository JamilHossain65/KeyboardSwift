#https://stackoverflow.com/questions/50951955/pytesseract-tesseractnotfound-error-tesseract-is-not-installed-or-its-not-i
#https://stackoverflow.com/questions/78545054/i-want-to-extract-bengali-text-from-a-pdf

# image to text
from PIL import Image
import pytesseract as tess

#Text to speech
from gtts import gTTS
import pygame
import os
import fitz

#Concate two sound file
#https://www.geeksforgeeks.org/how-to-concatenate-audio-files-in-python/

#support bangla language
#https://stackoverflow.com/questions/52891563/how-to-install-language-in-tesseract-ocr
def getText(page: int, name:str) -> str:
    text = tess.image_to_string(Image.open(name), lang="ben") #lang="ben+eng"
    text = 'পৃষ্ঠা '+ text
    #Replace
    text = text.replace("//৬/৬/-10111110191-00]া।", "")
    text = text.replace("\n", " ")
    text = text.replace("।", "।\n")
    return text
          
#Read image from PDF
#https://www.geeksforgeeks.org/how-to-extract-images-from-pdf-in-python/
#import fitz
bookname = "৩৮_আল্লাহর_নৈকট্য_লাভের_উপায়"
doc = fitz.open(bookname + '.pdf')
bookText = ""
for page in doc:
    if page.number == 23 :
       pix = page.get_pixmap(matrix=fitz.Identity, dpi = 1250,
                          colorspace=fitz.csRGB, clip=None, alpha=True, annots=True)
       img = Image.frombytes("RGB", [pix.width, pix.height], pix.samples)
       print(img)
       pageName = "PDFBook/allahr_noikotto_{page}.png".format(page = page.number)
       pix.save(pageName)  # save file
       bookText += getText(page.number + 1, pageName)
       #os.remove(pageName)
       break

with open(bookname + '.txt', 'w') as file:
    file.write(bookText)
    
filename = bookname + ".mp3"

tts = gTTS(text=bookText, lang='bn', slow=False)
tts.save(filename)

#save mp3 file
pygame.mixer.init()
pygame.mixer.music.load(filename)
pygame.mixer.music.play()

