
=========================== Setup Python =========================


https://flask.palletsprojects.com/en/3.0.x/installation/#install-flask
https://pypi.org/project/Flask


=========== Run Development Server from Terminal ==================
# At first copy 'demo.py' to your Desktop

# open terminal and run the following 2 lines of code

cd /Users/jamil/Desktop/

python3 demo.py


====== Error handle: NoModuleName SpeechRecognition ======

https://stackoverflow.com/questions/41797920/importerror-no-module-named-speech-recognition-in-python-idle

-------------------------------------------------------------------
!
!
!
========================== CONVRT TEXT TO SPEECH ==================
!
!
!
-------------------------------------------------------------------


https://www.geeksforgeeks.org/convert-text-speech-python/

# Playing sound directly

https://gtts.readthedocs.io/en/latest/module.html#languages-gtts-lang

#bangla text to speech
https://pypi.org/project/BanglaTTS/

If error occure then resolve from this link
https://stackoverflow.com/questions/71689095/how-to-solve-the-pytorch-runtimeerror-numpy-is-not-available-without-upgrading

pip install numpy==1.24.1

or

pip install "numpy<2"


=====================================================================

https://discuss.python.org/t/on-macos-14-pip-install-throws-error-externally-managed-environment/50352


× This environment is externally managed
╰─> To install Python packages system-wide, try brew install
    xyz, where xyz is the package you are trying to
    install.
    
=====================================================================
    
'''
import pyttsx3

text = 'The quick brown fox jumped over the lazy dog.'
def say(text):

    engine = pyttsx3.init()
    voices = engine.getProperty('voices')
    #engine.setProperty('voice', 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Speech\Voices\Tokens\TTS_MS_EN-US_ZIRA_11.0')
    engine.setProperty('voice', voices[1].id)
    engine.say(text)
    engine.runAndWait()

say(text)

'''
