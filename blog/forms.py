from django import forms
from blog.models import Post,Comment

class PostForm(forms.ModelForm):
    
    class Meta():
        models = Post
        fields = ('author','title','text')
        
        # adding css classes
        widgets = {
            'title':forms.TextInput(attrs={'class':'textinputclass'}),
            'text':forms.Textarea(attrs={'class':'editable medium-editor-textarea postcontent'})
        }
        
class CommentForm(forms.ModelForm):
    
    class Meta():
        models = Comment 
        fields = ('author','text')
        
        # adding css classes
        widgets = {
            'author':forms.TextInput(attrs={'class':'textinputclass'}),
            'text':forms.Textarea(attrs={'class':'editable medium-editor-textarea'})
        }
        