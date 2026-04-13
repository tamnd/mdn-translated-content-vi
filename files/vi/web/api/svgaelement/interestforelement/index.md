---
title: "SVGAElement: thuộc tính interestForElement"
short-title: interestForElement
slug: Web/API/SVGAElement/interestForElement
page-type: web-api-instance-property
status:
  - experimental
  - non-standard
browser-compat: api.SVGAElement.interestForElement
---

{{ApiRef("HTML DOM")}}{{SeeCompatTable}}{{non-standard_header}}

Thuộc tính **`interestForElement`** của giao diện {{domxref("SVGAElement")}} lấy hoặc đặt phần tử đích của một interest invoker, trong trường hợp phần tử {{svgelement("a")}} liên kết được chỉ định là một interest invoker.

Xem [Tạo một interest invoker](/en-US/docs/Web/API/Popover_API/Using_interest_invokers#creating_an_interest_invoker) để biết thêm chi tiết.

## Giá trị

Một phiên bản đối tượng {{domxref("Element")}}, hoặc `null` nếu phần tử `<a>` liên kết không có phần tử đích được đặt.

## Ví dụ

### Cách sử dụng cơ bản của `interestForElement`

Trong ví dụ này, chúng ta sử dụng thuộc tính `interestForElement` của phần tử SVG `<a>` để đặt phần tử đích của nó, sau đó lấy `tagName` của phần tử đích. `tagName` sau đó được đưa vào nội dung văn bản của phần tử `<a>`.

#### HTML

Đánh dấu chứa một phần tử SVG {{svgelement("a")}} với phần tử {{svgelement("text")}}, và văn bản liên kết được đưa vào trong phần tử `<text>`. Ngoài ra còn có một phần tử HTML `<div>`. Chúng ta biến phần tử `<div>` thành popover bằng cách đặt thuộc tính `popover` trên nó.

```html live-sample___basic-interest-invoker
<svg>
  <a href="#">
    <text x="90" y="20" text-anchor="middle">A link</text>
  </a>
</svg>
<div id="mypopover" popover>I am a <code>&lt;div&gt;</code> element.</div>
```

```css hidden live-sample___basic-interest-invoker
svg {
  width: 200px;
  height: 100px;
}

svg a text {
  fill: blue;
  text-decoration: underline;
}
```

#### JavaScript

Chúng ta lấy tham chiếu đến các phần tử `<a>`, `<text>` và `<div>` trong script. Sau đó, chúng ta tạo mối quan hệ interest invoker-target giữa `<a>` và `<div>` bằng cách đặt thuộc tính `interestForElement` của phần tử `<a>` bằng với tham chiếu đến `<div>`. Sau đó, chúng ta cập nhật nội dung `<text>` để hiển thị `tagName` của phần tử đích, được lấy qua `invoker.interestForElement.tagName`.

```js live-sample___basic-interest-invoker
const invoker = document.querySelector("a");
const invokerText = document.querySelector("text");
const popover = document.querySelector("div");

invoker.interestForElement = popover;

invokerText.textContent = `My target is a ${invoker.interestForElement.tagName} element`;
```

#### Kết quả

Ví dụ hiển thị như sau:

{{embedlivesample("basic-interest-invoker", "100%", "100")}}

Thử thể hiện sự quan tâm đến liên kết (ví dụ: bằng cách di chuột hoặc focus vào nó) để làm cho `<div>` xuất hiện.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng interest invokers](/en-US/docs/Web/API/Popover_API/Using_interest_invokers)
- [Popover API](/en-US/docs/Web/API/Popover_API)
