# Import the required module for text
# to speech conversion


from gtts import gTTS
#from banglatts import BanglaTTS

# Import pygame for playing the converted audio
import pygame

import subprocess
import pygame.time
from pygame.mixer import *

import gtts.lang

# Replace string framework
import re
import io

# source ~/.venv/bin/activate
# python3 -m pip install "ModuleName"
# importing all the required modules

#https://www.geeksforgeeks.org/python-convert-speech-to-text-and-text-to-speech/

import os
from time import sleep
from tqdm import tqdm


# https://www.tutorialspoint.com/writing-files-in-the-background-in-python
import threading
class MultiTask(threading.Thread):
   def __init__(self, message, filename):
      # invoking the Base class
      threading.Thread.__init__(self)
      # initializing the variables to class
      self.message = message
      self.filename = filename
      
   # run method that invokes in background
   def run(self):
         tts = gTTS(text=bookText, lang='bn', slow=False)
         tts.save(filename)

src = "/Users/jamil/Desktop/demo.mp3"
dest = "/Users/jamil/Desktop/myFile/demo.mp3"
    
# read pdf file in python
# https://www.geeksforgeeks.org/working-with-pdf-files-in-python/
# https://stackoverflow.com/questions/45795089/how-can-i-read-pdf-in-python
# creating a pdf reader object

# save this '২৯_ইসলামী রেনেসাঁ আন্দোলন.txt' file on desktop and then run on python
bookname = "৫৮_সীরাতে_ইবনে_হিশাম_৫"

with open( bookname + '.txt', 'r') as file:
    bookText = file.read()
    #print(bookText)

# file name
filename = bookname + ".mp3"
# The text that you want to convert to audio
# mytext = bookText

rep = {
 "(সঃ)" : "সল্লাল্লাহু আলাইহিওয়া সাল্লাম",
 "(সাঃ)" : "সল্লাল্লাহু আলাইহিওয়া সাল্লাম",
 "(আঃ)" :"আলাইহিওয়া সাল্লাম",
 "(রাঃ)"  :"রাদিআল্লাহু আনহু",
 "(রহঃ)"  :"রহমাতুল্লাহি আলাইহি",
 "(রাহঃ)"  :"রাহিমাহুল্লাহ",
 "(স)"   :"সল্লাল্লাহু আলাইহিওয়া সাল্লাম",
 "(সা)"  :"সল্লাল্লাহু আলাইহিওয়া সাল্লাম",
 "(আ)"  :"আলাইহিওয়া সাল্লাম",
 "(রা)"  :"রাদিআল্লাহু আনহু",
 "(রহ)"  :"রহমাতুল্লাহি আলাইহি",
 "(রাহ)" :"রাহিমাহুল্লাহ",
 # স্পেস
 "(সঃ )" : "সল্লাল্লাহু আলাইহিওয়া সাল্লাম",
 "(সাঃ )" : "সল্লাল্লাহু আলাইহিওয়া সাল্লাম",
 "(আঃ )" :"আলাইহিওয়া সাল্লাম",
 "(রাঃ )"  :"রাদিআল্লাহু আনহু",
 "(রহঃ )"  :"রহমাতুল্লাহি আলাইহি",
 "(রাহঃ )"  :"রাহিমাহুল্লাহ",
 "(স )"   :"সল্লাল্লাহু আলাইহিওয়া সাল্লাম",
 "(সা )"  :"সল্লাল্লাহু আলাইহিওয়া সাল্লাম",
 "(আ )"  :"আলাইহিওয়া সাল্লাম",
 "(রা )"  :"রাদিআল্লাহু আনহু",
 "(রহ )"  :"রহমাতুল্লাহি আলাইহি",
 "(রাহ )" :"রাহিমাহুল্লাহ",
 "(র)"   :"রহমাতুল্লাহি আলাইহি",
 
 # replace common word
 " কোন " :" কোনো ",
 " হীন " :" হীনো ",

 } # define desired replacements here

#use these three lines to do the replacement
rep = dict((re.escape(k), v) for k, v in rep.items())
pattern = re.compile("|".join(rep.keys()))
bookText = pattern.sub(lambda m: rep[re.escape(m.group(0))], bookText)

# trim white space
bookText = bookText.strip()
tLength = len(bookText)
print(tLength)

print("processing...")
for i in tqdm(range(tLength)):
    sleep(0.001)
    
file_write = MultiTask(bookText, filename)
# starting the task in background
file_write.start()
# another task
print("saving... ")
for i in tqdm(range(tLength)):
    sleep(0.01)
    
pygame.mixer.init()
pygame.mixer.music.load(filename)
pygame.mixer.music.play()
# completing the background task
file_write.join()
print("saved successfully!")

#tts = BanglaTTS(save_location='test')
#path = tts(bookText, voice='male', filename='jamil.mp3') # voice can be male or female


# get %
# https://www.reddit.com/r/pygame/comments/fr63iy/mixermusic_how_to_get_current_position/
#https://stackoverflow.com/questions/51795049/pygame-mixer-music-i-want-to-play-a-track-as-long-as-while-loop-is-running
  
