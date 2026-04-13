---
title: "TouchEvent: thuộc tính metaKey"
short-title: metaKey
slug: Web/API/TouchEvent/metaKey
page-type: web-api-instance-property
browser-compat: api.TouchEvent.metaKey
---

{{ APIRef("Touch Events") }}

Thuộc tính chỉ đọc **`metaKey`** của giao diện {{domxref("TouchEvent")}} trả về một giá trị boolean cho biết phím <kbd>Meta</kbd> có được bật hay không khi sự kiện chạm được tạo. Nếu phím này được bật, giá trị của thuộc tính là `true`. Nếu không, giá trị là `false`.

Thuộc tính này là {{ReadOnlyInline}}.

> [!NOTE]
> Trên bàn phím Macintosh, đây là phím <kbd>⌘ Command</kbd>. Trên bàn phím Windows, đây là phím Windows (<kbd>⊞</kbd>).

## Giá trị

Một giá trị boolean là `true` nếu phím <kbd>Meta</kbd> được bật cho sự kiện này; và `false` nếu phím <kbd>Meta</kbd> không được bật.

## Ví dụ

[Ví dụ về TouchEvent.altKey](/en-US/docs/Web/API/TouchEvent/altKey#examples) bao gồm ví dụ về cách sử dụng thuộc tính này.

## Đặc điểm kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
