# anudeepnrao.github.io

Personal portfolio website for Anudeep N Rao, hosted as a static GitHub Pages site.

## Structure

- `index.html` – Main landing page (about, experience, education, projects).
- `style.css` – Site-wide styles.
- `js/act.js` – Client-side interactions (project list/grid toggle).
- `img/` – Images and logos used by the site.
- `pdf/` – Resume and project/report documents.
- `projects/` – Additional project page scaffolding.

## Local preview

Run a simple static server from the repository root:

```bash
python3 -m http.server 4173 --bind 0.0.0.0
```

Then open:

- `http://127.0.0.1:4173/index.html`

## Notes

This repository is static HTML/CSS/JS and does not require a build step.
