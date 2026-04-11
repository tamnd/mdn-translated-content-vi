---
title: "HTMLImageElement: fetchPriority property"
short-title: fetchPriority
slug: Web/API/HTMLImageElement/fetchPriority
page-type: web-api-instance-property
browser-compat: api.HTMLImageElement.fetchPriority
---

{{APIRef("HTML DOM")}}

Thuộc tính **`fetchPriority`** của giao diện {{domxref("HTMLImageElement")}} thể hiện một gợi ý cho trình duyệt cho biết cách ưu tiên tìm nạp một hình ảnh cụ thể so với các hình ảnh khác. Nó phản ánh thuộc tính nội dung [`fetchpriority`](/en-US/docs/Web/HTML/Reference/Elements/img#fetchpriority) của phần tử `<img>`.

## Giá trị

Một chuỗi có giá trị là một trong `high`, `low` hoặc `auto`. Để biết ý nghĩa của chúng, hãy xem thuộc tính HTML [`fetchpriority`](/en-US/docs/Web/HTML/Reference/Attributes/fetchpriority).

## Ví dụ

```js
const img = new Image();
img.fetchPriority = "high";
img.src = "img/logo.png";
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLLinkElement.fetchPriority")}}
- {{domxref("HTMLScriptElement.fetchPriority")}}
- Tiêu đề HTTP {{httpheader("Link")}}
- [Tối ưu hóa việc tải tài nguyên bằng API ưu tiên tìm nạp](https://web.dev/articles/fetch-priority?hl=en#browser_priority_and_fetchpriority) để biết thông tin về mức độ ảnh hưởng của API này đến các ưu tiên trên Chrome.
