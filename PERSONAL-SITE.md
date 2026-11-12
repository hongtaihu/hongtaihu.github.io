# Hongtai Hu's personal site

The existing Academic Pages/Jekyll theme, author sidebar, and About/CV pages are retained. The publishing branch is `master`; GitHub Pages continues using its existing Jekyll branch-based build. The former publishing branch, `my-branch`, is retained as a backup.

- `_data/profile.json` is the shared content source for the web pages and Typst CV.
- `_pages/about.md` and `_pages/cv.md` use `_includes/profile-cv.html`.
- `resume/cv.typ` generates `files/hongtai-hu-cv.pdf`.
- `assets/css/profile.css` only adjusts the formatting of CV entries within the existing theme.
- The English CV uses Typst's bundled Libertinus Serif; a small Noto Sans SC subset provides the Chinese name glyphs.

Edit the empty `scholarships` list in `_data/profile.json` to add scholarships. Each entry should have `title` and `year` fields. Until then, the section stays hidden.

To compile the PDF locally:

```sh
typst compile --root . --font-path resume/fonts resume/cv.typ files/hongtai-hu-cv.pdf
```

The `Update Typst CV` workflow rebuilds and saves the PDF, then explicitly requests a GitHub Pages build so the published PDF is refreshed as well.

The sample publications, talks, posts, and demo pages are excluded from the published site. They remain in Git history and in the starter repository for reference. No new publications or recent open-source section is claimed.
