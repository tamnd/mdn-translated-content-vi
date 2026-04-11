---
title: "HTMLElement: thuộc tính lang"
short-title: lang
slug: Web/API/HTMLElement/lang
page-type: web-api-instance-property
browser-compat: api.HTMLElement.lang
---

{{ APIRef("HTML DOM") }}

Thuộc tính **`lang`** của giao diện {{domxref("HTMLElement")}} cho biết ngôn ngữ cơ sở của các giá trị thuộc tính và nội dung văn bản của phần tử, dưới dạng {{glossary("BCP 47 language tag")}}. Nó phản ánh thuộc tính [`lang`](/en-US/docs/Web/HTML/Reference/Global_attributes/lang) của phần tử; thuộc tính `xml:lang` không ảnh hưởng đến thuộc tính này.

Lưu ý rằng nếu thuộc tính `lang` không được chỉ định, bản thân phần tử có thể vẫn kế thừa ngôn ngữ từ phần tử cha. Tuy nhiên, ngôn ngữ được kế thừa đó không được phản ánh bởi giá trị của thuộc tính này.

## Giá trị

Một chuỗi. Các ví dụ phổ biến bao gồm "en" cho tiếng Anh, "ja" cho tiếng Nhật, "es" cho tiếng Tây Ban Nha, v.v. Nếu không được chỉ định, giá trị là một chuỗi rỗng.

## Ví dụ

```js
// this snippet compares the base language and
// redirects to another URL based on language
if (document.documentElement.lang === "en") {
  window.location.href = "Some_document.html.en";
} else if (document.documentElement.lang === "ru") {
  window.location.href = "Some_document.html.ru";
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
