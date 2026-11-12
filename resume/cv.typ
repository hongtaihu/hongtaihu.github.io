// The website and this CV share data/profile.json.
// typst compile --root . --font-path resume/fonts resume/cv.typ files/hongtai-hu-cv.pdf
#let cv = json("../_data/profile.json")
#let ink = rgb("171717")
#let muted = rgb("4a4a4a")
#let accent = rgb("171717")
#set document(title: cv.name + " — Curriculum Vitae", author: cv.name)
#set page(paper: "a4", margin: (x: 16mm, y: 13mm), numbering: none)
// Libertinus Serif is bundled with Typst; Noto is used only for Chinese glyphs.
#set text(font: ("Libertinus Serif", "Noto Sans SC"), size: 11pt, fill: ink, lang: "en")
#set par(leading: 0.45em, spacing: 0.55em, justify: false)
#set list(indent: 0pt, body-indent: 1em, tight: false, spacing: 3pt, marker: [•])
#show link: it => underline(text(fill: accent, it))
#let row(lhs, rhs) = grid(columns: (1fr, auto), column-gutter: 12pt, align: (left, right), lhs, text(size: 9.5pt, fill: muted, rhs))
#let section(title) = {
  v(7pt)
  block(breakable: false, width: 100%)[
    #text(size: 12pt, weight: "bold", fill: accent, title)
    #v(1pt)
    #line(length: 100%, stroke: 0.6pt + accent)
  ]
  v(3pt)
}
#align(center)[
  #text(size: 24pt, weight: "bold", cv.name)
  #h(8pt)#text(size: 12pt, fill: muted, cv.nameChinese)
  #v(4pt)
  #text(size: 9.5pt)[#link("mailto:" + cv.email, cv.email) #h(5pt) · #h(5pt) #link(cv.github, "github.com/" + cv.handle) #h(5pt) · #h(5pt) #link("https://hongtaihu.github.io", "hongtaihu.github.io")]
]
#section("Education")
#for (i, e) in cv.education.enumerate() {
  if i > 0 { v(5pt) }
  row(strong(e.school), e.period)
  v(2pt)
  [#e.degree · #e.major]
  parbreak()
}
#section("Honors & Awards")
#for (i, a) in cv.honors.enumerate() {
  if i > 0 { v(3pt) }
  row([*#a.title*], a.year)
  text(size: 10pt, fill: muted, a.detail)
  parbreak()
}
#if cv.scholarships.len() > 0 {
  section("Scholarships")
  for s in cv.scholarships { row(s.title, s.year); v(3pt) }
}
#section("Selected Projects")
#row(strong(cv.fuzz.cvTitle), cv.fuzz.period)
#v(2pt)
#text(size: 9.5pt, fill: muted, cv.fuzz.context + " · " + cv.fuzz.tools.join(" / "))
#v(3pt)
#list(..cv.fuzz.cvBullets.map(b => [#b]))
#v(3pt)
#text(size: 9pt, fill: muted)[
  Selected reports: #link(cv.cases.at(0).issueUrl, "shutdown during an in-flight rename") (#link(cv.cases.at(0).fixUrl, "fix #198019")); #link(cv.cases.at(1).issueUrl, "template annotation use-after-free") (#link(cv.cases.at(1).fixUrl, "fix #196788")).
]
#v(2pt)
#text(size: 8.5pt, fill: muted)[Fix status verified on #cv.verifiedDate; includes upstream merges after the thesis period. AI assistance was used in investigation and implementation.]
#v(6pt)
#row(strong(cv.emulator.title), cv.emulator.cvPeriod)
#v(2pt)
#text(size: 9.5pt, fill: muted, cv.emulator.context)
#v(3pt)
#list([#cv.emulator.description])
#section("Teaching & Academic Support")
#for (i, t) in cv.teaching.enumerate() {
  if i > 0 { v(5pt) }
  row(strong(t.title), t.period)
  v(2pt)
  text(size: 10.5pt, t.description)
  parbreak()
}
#section("Skills & Interests")
*Languages:* #cv.cvLanguages
#parbreak()
#v(2pt)
*Interests:* #cv.interests.join("; ").
