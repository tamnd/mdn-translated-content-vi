---
title: "Highlight: values() method"
short-title: values()
slug: Web/API/Highlight/values
page-type: web-api-instance-method
browser-compat: api.Highlight.values
spec-urls: https://tc39.es/ecma262/multipage/keyed-collections.html#sec-set.prototype.values
---

{{APIRef("CSS Custom Highlight API")}}

Phương thức **`values()`** của giao diện {{domxref("Highlight")}} trả về một đối tượng [Iterator](/en-US/docs/Web/JavaScript/Guide/Iterators_and_generators) mới chứa các giá trị cho mỗi đối tượng `Range` trong đối tượng `Highlight` theo thứ tự chèn vào.

> [!NOTE]
> Phương thức **`keys()`** là bí danh cho phương thức này. Nó hoạt động hoàn toàn giống và trả về **các giá trị** của các phần tử `Highlight`.

`Highlight` là một đối tượng giống {{jsxref("Set")}}, vì vậy điều này tương tự như sử dụng {{jsxref("Set.values()")}}.

## Cú pháp

```js-nolint
values()
```

### Tham số

Không có.

### Giá trị trả về

Một đối tượng iterator mới chứa mỗi đối tượng `Range` trong `Highlight` đã cho, theo thứ tự chèn vào.

## Ví dụ

Đoạn mã sau đây minh họa cách tạo một đối tượng `Highlight` mới với ba đối tượng `Range`, và sử dụng iterator được trả về bởi phương thức `values()` để ghi lại ba phạm vi:

```js
const myHighlight = new Highlight();
myHighlight.add(new Range());
myHighlight.add(new Range());
myHighlight.add(new Range());

const iter = myHighlight.values();

for (value of iter) {
  console.log(value); // Range
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("css_custom_highlight_api", "The CSS Custom Highlight API", "", "nocode")}}
- [CSS Custom Highlight API: The Future of Highlighting Text Ranges on the Web](https://css-tricks.com/css-custom-highlight-api-early-look/)
