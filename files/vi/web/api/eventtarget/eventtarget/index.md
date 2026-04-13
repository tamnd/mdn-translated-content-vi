---
title: "EventTarget: constructor EventTarget()"
short-title: EventTarget()
slug: Web/API/EventTarget/EventTarget
page-type: web-api-constructor
browser-compat: api.EventTarget.EventTarget
---

{{APIRef("DOM")}}{{AvailableInWorkers}}

Hàm tạo **`EventTarget()`** tạo ra một thể hiện mới của đối tượng {{domxref("EventTarget")}}.

> [!NOTE]
> Việc gọi trực tiếp hàm tạo này khá hiếm. Phần lớn thời gian, hàm tạo này được dùng bên trong hàm tạo của một đối tượng kế thừa giao diện {{domxref("EventTarget")}}, bằng từ khóa [`super`](/en-US/docs/Web/JavaScript/Reference/Operators/super).

## Cú pháp

```js-nolint
new EventTarget()
```

### Tham số

Không có.

### Giá trị trả về

Một thể hiện mới của đối tượng {{domxref("EventTarget")}}.

## Ví dụ

### Triển khai một bộ đếm

Ví dụ này triển khai lớp `Counter`, với các phương thức `increment()` và `decrement()`. Nó phát một sự kiện tùy chỉnh `"valuechange"` khi một trong hai phương thức này được gọi.

#### HTML

```html
<button id="dec" aria-label="Decrement">-</button>
<span id="currentValue">0</span>
<button id="inc" aria-label="Increment">+</button>
```

#### JavaScript

```js
class Counter extends EventTarget {
  constructor(initialValue = 0) {
    super();
    this.value = initialValue;
  }

  #emitChangeEvent() {
    this.dispatchEvent(new CustomEvent("valuechange", { detail: this.value }));
  }

  increment() {
    this.value++;
    this.#emitChangeEvent();
  }

  decrement() {
    this.value--;
    this.#emitChangeEvent();
  }
}

const initialValue = 0;
const counter = new Counter(initialValue);
document.querySelector("#currentValue").innerText = initialValue;

counter.addEventListener("valuechange", (event) => {
  document.querySelector("#currentValue").innerText = event.detail;
});

document.querySelector("#inc").addEventListener("click", () => {
  counter.increment();
});

document.querySelector("#dec").addEventListener("click", () => {
  counter.decrement();
});
```

#### Kết quả

{{EmbedLiveSample("Implementing a counter")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("EventTarget")}}
