---
title: "HTMLIFrameElement: thuộc tính privateToken"
short-title: privateToken
slug: Web/API/HTMLIFrameElement/privateToken
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.HTMLIFrameElement.privateToken
---

{{APIRef("HTML DOM")}}{{SeeCompatTable}}

Thuộc tính **`privateToken`** của giao diện {{domxref("HTMLIFrameElement")}} trả về một biểu diễn chuỗi của một đối tượng options đại diện cho một thao tác [private state token](/en-US/docs/Web/API/Private_State_Token_API/Using); đối tượng này có cùng cấu trúc với thuộc tính [`privateToken`](/en-US/docs/Web/API/RequestInit#privatetoken) của từ điển `RequestInit`.

Thuộc tính này phản chiếu nội dung của thuộc tính [`privateToken`](/en-US/docs/Web/HTML/Reference/Elements/iframe#privatetoken) của phần tử `<iframe>` liên kết.

## Giá trị

Một chuỗi.

## Ví dụ

```html
<iframe id="el" privateToken="{version: 1,operation: 'token-request'}">
</iframe>
```

```js
const el = document.getElementById("el");
console.log(el.privateToken);
// Logs "{version: 1,operation: 'token-request'}"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Private State Token API](/en-US/docs/Web/API/Private_State_Token_API)
