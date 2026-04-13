---
title: "Window: thuộc tính scrollbars"
short-title: scrollbars
slug: Web/API/Window/scrollbars
page-type: web-api-instance-property
browser-compat: api.Window.scrollbars
---

{{APIRef}}

Returns the `scrollbars` object.

This is one of a group of `Window` properties that contain a boolean `visible` property, that used to represent whether or not a particular part of a web browser's user interface was visible.

For privacy and interoperability reasons, the value of the `visible` property is now `false` if this `Window` is a popup, and `true` otherwise.

## Giá trị

An object containing a single property:

- `visible` {{ReadOnlyInline}}
  - : A boolean property, `false` if this `Window` is a popup, and `true` otherwise.

## Đặc tả kỹ thuật

{{Specifications}}

## Tính tương thích trên trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("window.locationbar")}}
- {{domxref("window.menubar")}}
- {{domxref("window.personalbar")}}
- {{domxref("window.statusbar")}}
- {{domxref("window.toolbar")}}
