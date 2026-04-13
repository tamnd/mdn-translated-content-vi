---
title: "HTMLLinkElement: thuộc tính fetchPriority"
short-title: fetchPriority
slug: Web/API/HTMLLinkElement/fetchPriority
page-type: web-api-instance-property
browser-compat: api.HTMLLinkElement.fetchPriority
---

{{APIRef("HTML DOM")}}

Thuộc tính **`fetchPriority`** của giao diện {{domxref("HTMLLinkElement")}} đại diện cho một gợi ý gửi đến trình duyệt về cách ưu tiên tải một tài nguyên cụ thể so với các tài nguyên khác cùng loại.
Nó phản ánh thuộc tính nội dung [`fetchpriority`](/en-US/docs/Web/HTML/Reference/Elements/link#fetchpriority) của phần tử `<link>`.

## Giá trị

Một chuỗi. Các giá trị được phép, xem thuộc tính HTML [`fetchpriority`](/en-US/docs/Web/HTML/Reference/Attributes/fetchpriority).

## Ví dụ

```js
const preloadLink = document.createElement("link");
preloadLink.href = "my-image.jpg";
preloadLink.rel = "preload";
preloadLink.as = "image";
preloadLink.fetchPriority = "high";
document.head.appendChild(preloadLink);
```

## Đặc tả kỹ thuật

{{Specifications}}

## Trình duyệt hỗ trợ

{{Compat}}

## Xem thêm

- {{domxref("HTMLImageElement.fetchPriority")}}
- {{domxref("HTMLScriptElement.fetchPriority")}}
- Tiêu đề HTTP {{httpheader("Link")}}
- [Tối ưu hóa việc tải tài nguyên với Fetch Priority API](https://web.dev/articles/fetch-priority?hl=en#browser_priority_and_fetchpriority) để biết thông tin về cách API này ảnh hưởng đến mức ưu tiên trên Chrome.
