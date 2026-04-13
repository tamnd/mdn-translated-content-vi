---
title: "HTMLFontElement: thuộc tính color"
short-title: color
slug: Web/API/HTMLFontElement/color
page-type: web-api-instance-property
status:
  - deprecated
browser-compat: api.HTMLFontElement.color
---

{{deprecated_header}}{{APIRef("HTML DOM")}}

Thuộc tính đã lỗi thời **`HTMLFontElement.color`** là một chuỗi phản ánh thuộc tính HTML [`color`](/en-US/docs/Web/HTML/Reference/Elements/font#color), chứa tên màu hoặc màu được chỉ định theo định dạng thập lục phân #RRGGBB.

Định dạng của chuỗi phải tuân theo một trong các microsyntax HTML sau (xem {{cssxref("&lt;color&gt;")}}):

| Microsyntax                | Mô tả                                 | Ví dụ                     |
| -------------------------- | ------------------------------------- | ------------------------- |
| Chuỗi màu tên hợp lệ       | _tênMàu (không phân biệt hoa thường)_ | `Green`, `green`, `GREEN` |
| Chuỗi màu hex hợp lệ       | _#RRGGBB_                             | `#008000`                 |
| RGB dùng giá trị thập phân | _rgb(x x x) (x trong khoảng 0-255)_   | `rgb(0 128 0)`            |

## Giá trị

Một chuỗi.

Khi được đặt thành giá trị `null`, giá trị `null` đó được chuyển đổi thành chuỗi rỗng (`""`), do đó `elt.color = null` tương đương với `elt.color = ""`.

## Ví dụ

```js
// Giả sử có phần tử <font id="f"> trong HTML

const f = document.getElementById("f");
f.color = "green";
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện {{domxref("HTMLFontElement")}} mà thuộc tính này thuộc về.
