# HDI_ORDA_Optimistic_Lock

![4D](https://img.shields.io/badge/4D-21.1-blue) ![License](https://img.shields.io/badge/license-MIT-green)

**How do I work with optimistic locking in ORDA?**

A "How Do I" (HDI) example for 4D that shows how ORDA entities detect concurrent modification through their **stamp**, and what you can do when a `save()` or `drop()` collides with another process.

## Features

The demo walks through seven tabs, each building on the previous one with a small Student/School data model:

| Step | Topic | What you see |
|------|-------|--------------|
| 1 | Introduction | Overview of the entity methods used in the example |
| 2 | Stamp conflict on save | Another process modifies the entity, so `entity.save()` fails; compare the stamp in memory with the stamp in the database |
| 3 | Reload and clone | Recover with `entity.reload()` or `entity.clone()`, then apply your change again |
| 4 | Stamp conflict on drop | `entity.drop()` fails, then succeeds with `dk force drop if stamp changed` |
| 5 | Touched attributes | `entity.touched()` and `entity.touchedAttributes()` report what was modified in memory |
| 6 | Compare entities | `entity.diff()` lists the attributes that differ between two entities |
| 7 | Resolve conflicts | `save(dk auto merge)` merges silently when possible; otherwise `diff()` drives a manual "mine vs. theirs" merge UI |

## Points of interest

- **Simulating a second user.** `PS_updater` starts a separate process (`New process` with the unique-process option) that updates the same entity, which is how the stamp changes behind your back.
- **Reading the database stamp.** Use `ds.Student.get(entity.getKey()).getStamp()` to fetch the current stamp of the stored entity and compare it with `entity.getStamp()`.
- **Automatic merge.** `save(dk auto merge)` succeeds when the concurrent changes touch different attributes. `status.autoMerged` tells you whether it did.
- **Manual merge.** When auto merge is impossible, `entity.diff(entityFromDB)` feeds a collection list box; the `touchedAttributes()` collection decides which rows offer a "Update with mine" check box.
- **Collection list boxes with meta expressions.** `decorate` bolds the selected row through the list box `metaSource`.
- **Data seeding.** Students and schools are rebuilt from `Resources/students_data.json` and `schools_data.json` with `dataClass.fromCollection()`. Page text comes from the `INFO` table, imported from `Resources/INFO.4ie` on first run.

## Requirements

- 4D 21.1 or later to open the project (the original example targeted 4D v17).
- No additional licenses are needed.

## Getting started

1. Open `Project/HDI_ORDA_Optimistic_Lock.4DProject` with 4D.
2. Run the project in interpreted mode. The splash form opens automatically; click **Demo** to start.
3. Use **File > Demo** (`Cmd/Ctrl+K`) to bring the demo window back to the front.
4. Turn on the **Trace** check box on any tab to step through the object method with the debugger.

## Project layout

```
Project/Sources/
  Methods/                 00_Start (launcher), initPages, PS_updater, decorate, ...
  Forms/HDI/               splash form
  Forms/HDI2/              the seven-tab demo form and its object methods
  TableForms/1/            list and detail forms for the INFO table
  menus.json               menu bar (standard actions, XLIFF titles)
  styleSheets*.css         shared, macOS and Windows style sheets
Resources/
  en.lproj, ja.lproj       XLIFF localisation (English, Japanese)
  *_data.json, INFO.4ie    sample data and page content
```

## Platform notes

- **Localisation:** all form text, menu titles and alert messages are resolved from XLIFF (`:xliff:` references and `Localized string`). English and Japanese are provided.
- **Dark mode:** the style sheets use `prefers-color-scheme` media queries and the `automatic` / `automaticAlternate` colour values. Colours set from code are read from hidden reference rectangles so they follow the active theme.
- **macOS Tahoe (Liquid Glass):** push button height is set by CSS (27px for `liquid-glass`, 23px for `mac-classic`), so the buttons get the rounded Liquid Glass look.
- **List boxes:** columns do not truncate with an ellipsis, and only the last column grows when the list box is resized.
- **Startup:** the launcher uses `CALL WORKER` and a non-blocking `DIALOG(...; *)`. Calling it again brings the existing window to the front instead of opening a duplicate.

## Origin

This project started as the binary `.4DB` example database distributed with 4D v17. It was converted to a project (`.4DProject`) with 4D 21, then modernised.

- **Blog post:** https://blog.4d.com/working-with-orda-optimistic-locking/
- **Original download:** https://download.4d.com/Demos/4D_v17/HDI_ORDA_Optimistic_Lock.zip

## References

- [ORDA overview](https://developer.4d.com/docs/ORDA/overview)
- [Optimistic locking in ORDA](https://developer.4d.com/docs/ORDA/entities#using-entity-locking)
- [`entity.save()`](https://developer.4d.com/docs/API/EntityClass#save), [`entity.drop()`](https://developer.4d.com/docs/API/EntityClass#drop), [`entity.diff()`](https://developer.4d.com/docs/API/EntityClass#diff), [`entity.touchedAttributes()`](https://developer.4d.com/docs/API/EntityClass#touchedattributes)
- [CSS in 4D forms](https://developer.4d.com/docs/FormEditor/stylesheets)
- [XLIFF localisation](https://developer.4d.com/docs/Project/localization)

## License

[MIT](LICENSE)
