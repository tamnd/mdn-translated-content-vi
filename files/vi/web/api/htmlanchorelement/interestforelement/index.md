---
title: "HTMLAnchorElement: thuộc tính interestForElement"
short-title: interestForElement
slug: Web/API/HTMLAnchorElement/interestForElement
page-type: web-api-instance-property
status:
  - experimental
  - non-standard
browser-compat: api.HTMLAnchorElement.interestForElement
---

{{ApiRef("HTML DOM")}}{{SeeCompatTable}}{{non-standard_header}}

Thuộc tính **`interestForElement`** của giao diện {{domxref("HTMLAnchorElement")}} lấy hoặc đặt phần tử mục tiêu của một trình gọi quan tâm, trong trường hợp phần tử {{htmlelement("a")}} liên quan được chỉ định là một trình gọi quan tâm.

Xem [Tạo một trình gọi quan tâm](/en-US/docs/Web/API/Popover_API/Using_interest_invokers#creating_an_interest_invoker) để biết thêm chi tiết.

## Giá trị

Một đối tượng {{domxref("Element")}}, hoặc `null` nếu phần tử `<a>` liên quan không có phần tử mục tiêu được đặt.

## Ví dụ

### Sử dụng cơ bản `interestForElement`

Trong ví dụ này, chúng ta sử dụng thuộc tính `interestForElement` của một phần tử `<a>` để đặt phần tử mục tiêu của nó và sau đó lấy `tagName` của phần tử đó. `tagName` sau đó được hiển thị trong nội dung văn bản của phần tử `<a>`.

#### HTML

Phần đánh dấu bao gồm một phần tử `<a>` và một phần tử `<div>`. Chúng ta biến phần tử `<div>` thành một popover bằng cách đặt thuộc tính `popover` trên nó.

```html live-sample___basic-interest-invoker
<a href="#">một liên kết</a>
<div id="mypopover" popover>Tôi là một phần tử <code>&lt;div&gt;</code>.</div>
```

#### JavaScript

Chúng ta lấy tham chiếu đến các phần tử `<a>` và `<div>` trong script. Sau đó, chúng ta tạo mối quan hệ trình gọi quan tâm - mục tiêu giữa `<a>` và `<div>` bằng cách đặt thuộc tính `interestForElement` của phần tử `<a>` bằng tham chiếu đến `<div>`. Sau đó, chúng ta cập nhật nội dung văn bản của phần tử `<a>` để bao gồm một chuỗi chứa `tagName` của phần tử mục tiêu, được lấy qua `invoker.interestForElement.tagName`.

```js live-sample___basic-interest-invoker
const invoker = document.querySelector("a");
const popover = document.querySelector("div");

invoker.interestForElement = popover;

invoker.textContent = `Mục tiêu của tôi là một phần tử ${invoker.interestForElement.tagName}`;
```

#### Kết quả

Ví dụ được hiển thị như sau:

{{embedlivesample("basic-interest-invoker", "100%", "100")}}

Thử thể hiện sự quan tâm đến liên kết (ví dụ: bằng cách di chuột hoặc tập trung vào nó) để làm cho `<div>` xuất hiện.

## Đặc tả kỹ thuật

{{Specifications}}

## Trình duyệt hỗ trợ

{{Compat}}

## Xem thêm

- [Sử dụng trình gọi quan tâm](/en-US/docs/Web/API/Popover_API/Using_interest_invokers)
- [Popover API](/en-US/docs/Web/API/Popover_API)
