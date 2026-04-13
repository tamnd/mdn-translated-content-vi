---
title: "HTMLIFrameElement: thuộc tính browsingTopics"
short-title: browsingTopics
slug: Web/API/HTMLIFrameElement/browsingTopics
page-type: web-api-instance-property
status:
  - deprecated
  - non-standard
browser-compat: api.HTMLIFrameElement.browsingTopics
---

{{APIRef("HTML DOM")}}{{non-standard_header}}{{deprecated_header}}

> [!WARNING]
> Tính năng này hiện đang vấp phải sự phản đối từ hai nhà phát triển trình duyệt. Xem phần [Vị trí tiêu chuẩn](/en-US/docs/Web/API/Topics_API#standards_positions) để biết chi tiết về sự phản đối.

Thuộc tính **`browsingTopics`** của giao diện {{domxref("HTMLIFrameElement")}} là một boolean chỉ định rằng các chủ đề đã chọn cho người dùng hiện tại sẽ được gửi cùng yêu cầu cho nguồn của {{htmlelement("iframe")}} liên kết thông qua tiêu đề {{httpheader("Sec-Browsing-Topics")}}. Thuộc tính này phản ánh thuộc tính HTML `browsingtopics`.

Xem [Sử dụng Topics API](/en-US/docs/Web/API/Topics_API/Using) để biết thêm chi tiết.

## Giá trị

Một boolean. Giá trị mặc định là `false`; đặt thành `true` để gửi yêu cầu nguồn `<iframe>` liên kết với tiêu đề {{httpheader("Sec-Browsing-Topics")}} chứa các chủ đề đã chọn cho người dùng hiện tại.

## Ví dụ

### Get

Đặt `browsingtopics` thành `true` rồi tải nội dung `<iframe>` một cách khai báo:

```html
<iframe browsingtopics title="Advertising container" src="ad-tech1.example">
  ...
</iframe>
```

Ghi lại giá trị `browsingTopics` qua script:

```js
const iframeElem = document.querySelector("iframe");
console.log(iframeElem.browsingTopics); // sẽ trả về true trong các trình duyệt hỗ trợ
```

### Set

Chỉ định một `<iframe>` tối thiểu:

```html
<iframe> ... </iframe>
```

Đặt `browsingtopics` thành `true` rồi tải nội dung `<iframe>` qua script:

```js
const iframeElem = document.querySelector("iframe");

iframeElem.browsingTopics = true;
iframeElem.title = "Advertising container";
iframeElem.src = "ad-tech1.example";
```

## Đặc tả kỹ thuật

Tính năng này không phải là một phần của bất kỳ tiêu chuẩn chính thức nào, mặc dù nó được chỉ định trong [Topics API Unofficial Proposal Draft](https://patcg-individual-drafts.github.io/topics/).

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Topics API](/en-US/docs/Web/API/Topics_API)
