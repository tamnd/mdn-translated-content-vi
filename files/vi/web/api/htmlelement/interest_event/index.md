---
title: "HTMLElement: sự kiện interest"
slug: Web/API/HTMLElement/interest_event
page-type: web-api-event
status:
  - experimental
  - non-standard
browser-compat: api.HTMLElement.interest_event
---

{{APIRef("HTML DOM")}}{{SeeCompatTable}}{{non-standard_header}}

Sự kiện **`interest`** của giao diện {{domxref("HTMLElement")}} được kích hoạt trên phần tử đích của [trình gọi quan tâm](/en-US/docs/Web/API/Popover_API/Using_interest_invokers) khi sự quan tâm được thể hiện, cho phép chạy mã để phản hồi.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("interest", (event) => { })

oninterest = (event) => { }
```

## Loại sự kiện

Một {{domxref("InterestEvent")}}. Kế thừa từ {{domxref("Event")}}.

{{InheritanceDiagram("InterestEvent")}}

## Ví dụ

### Sử dụng cơ bản sự kiện trình gọi quan tâm

Trong ví dụ này, chúng ta dùng các sự kiện `interest` và `loseinterest` để báo cáo khi sự quan tâm được thể hiện và mất đi trên phần tử {{htmlelement("button")}} đóng vai trò là trình gọi quan tâm. Chúng ta làm điều này bằng cách in thông điệp vào nội dung văn bản của phần tử {{htmlelement("p")}} đích.

#### HTML

Chúng ta thiết lập mối quan hệ giữa phần tử `<button>` trình gọi quan tâm và phần tử `<p>` đích bằng cách đặt giá trị của thuộc tính `interestfor` của `<button>` bằng với `id` của `<p>`.

```html live-sample___basic-interest-invoker
<button href="#" interestfor="mytarget">Interest invoker</button>
<p id="mytarget">No interest being shown currently.</p>
```

#### JavaScript

Chúng ta lấy tham chiếu đến phần tử `<button>` và phần tử đích thông qua thuộc tính {{domxref("HTMLButtonElement.interestForElement", "interestForElement")}}.

```js live-sample___basic-interest-invoker
const invoker = document.querySelector("[interestfor]");
const target = invoker.interestForElement;
```

Sau đó, chúng ta đặt hai trình lắng nghe sự kiện trên phần tử đích, cho các sự kiện `interest` và `loseinterest`.

- Khi sự quan tâm được thể hiện, chúng ta cập nhật nội dung văn bản của phần tử `<p>` đích để báo cáo sự kiện và bao gồm phần tử kích hoạt nó; trong ví dụ này, đó là phần tử `<button>`. Lưu ý cách bạn có thể lấy tham chiếu đến trình gọi quan tâm thông qua thuộc tính {{domxref("InterestEvent.source", "source")}} của đối tượng sự kiện.
- Khi sự quan tâm bị mất, chúng ta cập nhật văn bản đoạn văn để báo cáo rằng sự quan tâm không còn được thể hiện.

```js live-sample___basic-interest-invoker
target.addEventListener("interest", (e) => {
  target.textContent = `Interest shown via the ${e.source.tagName} element.`;
});

target.addEventListener("loseinterest", () => {
  target.textContent = `Interest lost.`;
});
```

#### Kết quả

Ví dụ hiển thị như sau:

{{embedlivesample("basic-interest-invoker", "100%", "100")}}

Hãy thử thể hiện và mất quan tâm vào nút (ví dụ: bằng cách di chuột qua hoặc tiêu điểm vào nó) để xem cách văn bản `<p>` thay đổi.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Sự kiện {{domxref("HTMLElement.loseinterest_event", "loseinterest")}}
- [API Popover](/en-US/docs/Web/API/Popover_API)
- [Sử dụng trình gọi quan tâm](/en-US/docs/Web/API/Popover_API/Using_interest_invokers)
