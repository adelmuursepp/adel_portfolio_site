
# Don't run in the middle of deployment

# # # # # # # # # # # # # # # # # # # # # # #
# Application Specific

User.destroy_all()

User.create!(
  email: "adel.muursepp@gmail.com",
  password: "passwordpassword",
  password_confirmation: "passwordpassword",
  roles: "site_admin"
)

puts "#{User.count} users created."



# # # # # # # # # # # # # # # # # # # # # # #
# Blogs

Blog.destroy_all()

Topic.destroy_all()

Topic.create!(title: "Art")
Topic.create!(title: "Coding")
Topic.create!(title: "Philosophy")

puts "#{Topic.count} topics created."

Blog.create!(
  title: Faker::Lorem.words(5).join(" ").titlecase,
  body: Faker::Lorem.paragraphs(3).join("\n\n"),
  topic_id: Topic.last.id,
  status: rand(0..1)
)

puts "#{Blog.count} blog posts created."


1.times do
    Comment.create!(
        content: Faker::Lorem.words(15).join(" "),
        user_id: User.last.id,
        blog_id: Blog.last.id
    )
end

puts "#{Comment.count} comments created."



# # # # # # # # # # # # # # # # # # # # # # #
# Boot camp prep

ResourceItem.destroy_all()
ResourceTopic.destroy_all()
ResourceCategory.destroy_all()


ResourceCategory.create!(title: "Coding- iOS")
ResourceCategory.create!(title: "Coding- Rails")

puts "#{ResourceCategory.count} resource categories created."




ResourceTopic.create!(title: "Rails Boot Camp Prep",
                      intro: "Materials for preparing for Ruby on Rails boot camp.",
                      resource_category_id: ResourceCategory.last.id)

puts "#{ResourceTopic.count} resource topics created."

markdown_sample = '# h1 Heading
## h2 Heading
### h3 Heading 😁
#### h4 Heading
##### h5 Heading
###### h6 Heading

😂👩🏻‍💻

## Horizontal Rules

___

---

***


## Typographic replacements
&copy;



## Emphasis

**This is bold text**

__This is bold text__

*This is italic text*

_This is underlined text_

~~Strikethrough~~


## Quotes

This is a "quote".



## Blockquotes


> Blockquotes can be included by using greater-than signs right next to the quotes.


## Lists

Unordered

+ Create a list by starting a line with `+`, `-`, or `*`
+ Sub-lists are made by indenting 2 spaces:
  - Marker character change forces new list start:
    * Ac tristique libero volutpat at
    + Facilisis in pretium nisl aliquet
    - Nulla volutpat aliquam velit
+ Very easy!

Ordered

1. Lorem ipsum dolor sit amet
2. Consectetur adipiscing elit
3. Integer molestie lorem at massa


1. You can use sequential numbers...
1. ...or keep all the numbers as `1.`



## Code

Inline `code`

Indented code

    // Some comments
    line 1 of code
    line 2 of code
    line 3 of code


Block code "fences"

```
Sample text here...
```

Syntax highlighting

``` js
var foo = function (bar) {
  return bar++;
};

console.log(foo(5));
```

## Tables

| Column A | Column B | Column C |
|----------+----------+----------|
| Cell A1  | Cell B1  | Cell C1  |
| Cell A2  | Cell B2  | Cell C2  |
| Cell A3  | Cell B3  | Cell C3  |

| Column A | Column B | Column C |
|----------|----------|----------|
| Cell A1  | Cell B1  | Cell C1  |
| Cell A2  | Cell B2  | Cell C2  |
| Cell A3  | Cell B3  | Cell C3  |


## Links

[link text](http://dev.nodeca.com)

[link with title](http://nodeca.github.io/pica/demo/ "title text!")

Autoconverted link https://github.com/nodeca/pica (enable linkify to see)


## Images

![Minion](https://octodex.github.com/images/minion.png)
![Stormtroopocat](https://octodex.github.com/images/stormtroopocat.jpg "The Stormtroopocat")

Like links, Images also have a footnote style syntax

![Alt text][id]

With a reference later in the document defining the URL location:

[id]: https://octodex.github.com/images/dojocat.jpg  "The Dojocat"



### Superscript

- 19^th


### \<mark>

==Marked text==


### Footnotes

Footnote 1 link[^1].

Footnote 2 link[^2].

[^3]: Text of inline footnote definition.

Another footnote link[^3]. Duplicated footnote reference[^2].

[^1]: Footnote **can have markup**

    and multiple paragraphs.

[^2]: Footnote text.'

introduction_item = '
---
Here is some of my advice and resources I wish I had known before boot camp.
Preparing for boot camps is not necessary, you would finish the boot camp anyway,
however there is absolutely no limit to being prepared. The more you know,
the more you will find coding fun and gain a better understanding.

**Disclaimer:** As I am a person who wanted to be extremely prepared, I would
do tens of courses, memorize everything and during boot camp not sleep to make
sure I was on top of the material. This is in no way necessary, but I have to
admit, extra work paid off. 📚 Point is: just do as much as you can and don\'t
stress about being unprepared - I promise some people will have done nothing,
you are already fine!💪



'

topic_1 = '
---
### Objectives
+ Understand that computers communicate through windows called terminals
+ Know how to manipulate and move between files


### Homework
Learn to use terminal on your computer. The excellent link for learning: [Terminal basics](https://www.learnenough.com/command-line-tutorial/basics)
**How?** Learning about terminal is where you want to **memorize** words. I went through every page of tutorial,
wrote flash cards about every command and made sure I knew everything from memory.
It is not necessary to study so much 🤓 but in the end I could actually somehow
 understand what was going on in the boot camp.



'

hands_on_item = '
---
It is very nice to try out some of the trillion tools you will be using during two monts.
No worries, it is not about learning 10 new languages, just little extras that I wish I would have known how to use during camp.

### __Projects to try__

#### Try to make a Figma app prototype

**Why?** Figma is the application to make design for your app. When developing apps, you will probably have a day to make a design for the app.
Not being able to place everything and make use of it will frustrate you a little and will give not so nice design.

**What?** Make an app for bike rental, dog walking. I made a dating app for example...
A dating app for a client on Figma: [Dating app link](https://www.figma.com/file/uKIw2CtcWRFfzVyzd2Jwb2/dating-ios)


Hint: There are also beautiful templates that you can download and make use of


#### Try to put a very easy Rails app on web

**Why?** It is a sneak peek into what will be coming. It is just interesting to know
what you will be working towards 🧑‍💻

**What?** Very easy basic commands. Using Rails Girls tutorial that is available here:
[Easy Rails tutorial](http://guides.railsgirls.com/app)



'

tips_item = '
---
### Tips for learning how to better code

+ Try to read Medium articles about coding. Medium is the place where you
can catch up with trends in the code world and sound smart when talking to
professional developers😉 Try out little tutorials about terminal for example.
As I do Data Science, I follow Towards Data Science thread. Try it out: [Medium](medium.com)

+ Think how you can make flash cards for yourself easily - coding is like a language, you need to memorize words to be able to speak it.
I would personally do 50 flash cards **every day**. And then review them. Although paper works, I think Flash Cards Go is a decent app as well 👈

+ Learn to type using all ten fingers just right and practise typing as much as possible
(It is a good motivation for dull work on Word 🤓)

+ Learn basic Spectacle short cuts so you can fit multiple screens easily and be a more efficient coder💪

+ Drop Safari. No other browser than Chrome will be used for two months.
If you want, remember a couple short cuts that you like using in Chrome.

+ Post a question on Stack Overflow. Stack Overflow and its coding community will be your
best friend for the time. It is nice to get used to it and know how to find answers.
(For example I got my whole project fixed by a random dude)



'

ResourceItem.create!(title: 'Introduction',
                      body: introduction_item,
                      resource_topic_id: ResourceTopic.last.id)

ResourceItem.create!(title: 'Topic 1. Using Terminal',
                      body: topic_1,
                      resource_topic_id: ResourceTopic.last.id)

# ResourceItem.create!(title: "Rails Boot Camp Prep",
#                       body: markdown_sample,
#                       resource_topic_id: ResourceTopic.last.id)

ResourceItem.create!(title: "Hands on practicing",
                      body: hands_on_item,
                      resource_topic_id: ResourceTopic.last.id)

ResourceItem.create!(title: "Tips",
                      body: tips_item,
                      resource_topic_id: ResourceTopic.last.id)

puts "#{ResourceItem.count} resource items created."






