---
title: "Window: thuộc tính locationbar"
short-title: locationbar
slug: Web/API/Window/locationbar
page-type: web-api-instance-property
browser-compat: api.Window.locationbar
---

{{APIRef}}

Returns the `locationbar` object.

This is one of a group of `Window` properties that contain a boolean `visible` property, that used to represent whether or not a particular part of a web browser's user interface was visible.

For privacy and interoperability reasons, the value of the `visible` property is now `false` if this `Window` is a popup, and `true` otherwise.

## Giá trị

An object containing a single property:

- `visible` {{ReadOnlyInline}}
  - : A boolean property, `false` if this `Window` is a popup, and `true` otherwise.

## Specifications

{{Specifications}}

## Tính tương thích trên trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("window.menubar")}}
- {{domxref("window.personalbar")}}
- {{domxref("window.scrollbars")}}
- {{domxref("window.statusbar")}}
- {{domxref("window.toolbar")}}
