
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

topic_1 = '
---
### Objectives
+ Understand that computers communicate through windows called terminals
+ Know how to manipulate and move between files
'

tips_item = '
---
### Tips for learning how to better code
+ Try to read Medium articles about coding
+ Think how you can make flash cards for yourself easily - coding is like a language, you need to memorize words to be able to speak it. I would personally do 50 flash cards every. day. And then review them. Although paper works, I think Flash Cards Go is a decent app as well 👈

'

ResourceItem.create!(title: 'Topic 1. Using Terminal',
                      body: topic_1,
                      resource_topic_id: ResourceTopic.last.id)

ResourceItem.create!(title: "Rails Boot Camp Prep",
                      body: markdown_sample,
                      resource_topic_id: ResourceTopic.last.id)

ResourceItem.create!(title: "Rails Boot Camp Prep",
                      body: "Materials for preparing for Ruby on Rails boot camp.",
                      resource_topic_id: ResourceTopic.last.id)

ResourceItem.create!(title: "Tips",
                      body: tips_item,
                      resource_topic_id: ResourceTopic.last.id)

puts "#{ResourceItem.count} resource items created."






