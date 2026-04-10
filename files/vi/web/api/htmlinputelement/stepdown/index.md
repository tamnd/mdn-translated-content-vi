---
title: "HTMLInputElement: phương thức stepDown()"
short-title: stepDown()
slug: Web/API/HTMLInputElement/stepDown
page-type: web-api-instance-method
browser-compat: api.HTMLInputElement.stepDown
---

{{APIRef("HTML DOM")}}

Phương thức **`HTMLInputElement.stepDown()`** giảm giá trị của loại đầu vào {{HTMLElement("input")}} số theo giá trị của thuộc tính [`step`](/en-US/docs/Web/HTML/Reference/Attributes/step) hoặc tối đa `n` bội số của thuộc tính step nếu một số được truyền làm tham số.

Phương thức, khi được gọi, giảm [`value`](/en-US/docs/Web/HTML/Reference/Elements/input#value) đi ([`step`](/en-US/docs/Web/HTML/Reference/Elements/input#step) \* n), trong đó n mặc định là 1 nếu không được chỉ định, và [`step`](/en-US/docs/Web/HTML/Reference/Attributes/step) mặc định là giá trị mặc định cho `step` nếu không được chỉ định.

Hợp lệ trên tất cả các loại đầu vào số, ngày và thời gian hỗ trợ thuộc tính step, bao gồm {{HTMLElement("input/date", "date")}}, {{HTMLElement("input/month", "month")}}, {{HTMLElement("input/week", "week")}}, {{HTMLElement("input/time", "time")}}, {{HTMLElement("input/datetime-local", "datetime-local")}}, {{HTMLElement("input/number", "number")}}, và {{HTMLElement("input/range", "range")}}.

Cho `<input id="myTime" type="time" max="17:00" step="900" value="17:00">`, việc gọi `myTime.stepDown(3)` sẽ thay đổi giá trị thành 16:15, giảm thời gian đi `3 * 900`, hay 45 phút. `myTime.stepDown()`, không có tham số, sẽ cho kết quả `16:45`, vì `n` mặc định là `1`.

```html
<!-- giảm theo khoảng 900 giây (15 phút) -->
<input type="time" max="17:00" step="900" />

<!-- giảm theo khoảng 7 ngày (một tuần) -->
<input type="date" max="2019-12-25" step="7" />

<!-- giảm theo khoảng 12 tháng (một năm) -->
<input type="month" max="2019-12" step="12" />
```

Tuy nhiên, gọi `stepDown` trên `<input type="time" max="17:00" step="900">` sẽ không đặt giá trị thành `17:00` như mong đợi — và như nó làm với `stepUp` khi đầu vào là `<input type="time" min="17:00" step="900">`. Thay vào đó, lần gọi `stepDown` đầu tiên sẽ đặt giá trị ban đầu thành `23:45` mặc dù thuộc tính `max` được đặt. Lần gọi thứ hai sẽ đặt giá trị thành `17:00`. Và lần gọi thứ ba sẽ đặt giá trị thành `16:45`.

```js
let input1 = document.createElement("input");
input1.setAttribute("type", "time");
input1.setAttribute("min", "17:00");
input1.setAttribute("step", 900);
console.log(input1.value); // ""
input1.stepUp();
console.log(input1.value); // "17:00"
// Tuy nhiên
let input2 = document.createElement("input");
input2.setAttribute("type", "time");
input2.setAttribute("max", "17:00");
input2.setAttribute("step", 900);
console.log(input2.value); // ""
input2.stepDown();
console.log(input2.value); // "23:45"
input2.stepDown();
console.log(input2.value); // "17:00"
input2.stepDown();
console.log(input2.value); // "16:45"
```

Phương thức, khi được gọi, thay đổi giá trị của điều khiển biểu mẫu theo giá trị được cho trong thuộc tính `step`, nhân với tham số, trong các ràng buộc được đặt trong điều khiển biểu mẫu. Giá trị mặc định cho tham số, nếu không được truyền, là 1. Phương thức sẽ không làm cho giá trị đi dưới giá trị [`min`](/en-US/docs/Web/HTML/Reference/Attributes/min) được đặt hoặc vi phạm các ràng buộc do thuộc tính [`step`](/en-US/docs/Web/HTML/Reference/Attributes/step) đặt ra. Giá trị âm cho `n` sẽ tăng giá trị, nhưng sẽ không tăng vượt quá giá trị [`max`](/en-US/docs/Web/HTML/Reference/Attributes/max).

Nếu giá trị trước khi gọi phương thức `stepDown()` không hợp lệ, ví dụ: nếu nó không phù hợp với các ràng buộc do thuộc tính `step` đặt ra, việc gọi phương thức `stepDown()` sẽ trả về giá trị phù hợp với các ràng buộc của điều khiển biểu mẫu.

Nếu điều khiển biểu mẫu không phải là thời gian, ngày hoặc số, và do đó không hỗ trợ thuộc tính `step` (xem danh sách các loại đầu vào được hỗ trợ ở trên), hoặc nếu giá trị `step` được đặt thành `any`, ngoại lệ `InvalidStateError` sẽ được ném ra.

## Cú pháp

```js-nolint
stepDown()
stepDown(stepDecrement)
```

### Tham số

- `stepDecrement` {{optional_inline}}
  - : Một giá trị số. Nếu không có tham số được truyền, _stepDecrement_ mặc định là 1.

    Nếu giá trị là số thập phân, giá trị sẽ giảm như thể [`Math.floor(stepDecrement)`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/floor) được truyền. Nếu giá trị âm, giá trị sẽ tăng thay vì giảm.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ngoại lệ

- `InvalidStateError` {{domxref("DOMException")}}
  - : Ném ra trong một trong các trường hợp sau:
    - nếu phương thức không áp dụng cho giá trị [`type`](/en-US/docs/Web/HTML/Reference/Elements/input#type) hiện tại,
    - nếu phần tử không có giá trị [`step`](/en-US/docs/Web/HTML/Reference/Elements/input#step),
    - nếu [`value`](/en-US/docs/Web/HTML/Reference/Elements/input#value) không thể chuyển đổi thành số,
    - nếu giá trị kết quả trên [`max`](/en-US/docs/Web/HTML/Reference/Elements/input#max) hoặc dưới [`min`](/en-US/docs/Web/HTML/Reference/Elements/input#min).

## Ví dụ

Nhấp vào nút trong ví dụ này để giảm loại đầu vào {{HTMLElement("input/number", "number")}}:

### HTML

```html
<p>
  <label for="theNumber">
    Nhập một số từ 0 đến 400 chia hết cho 5:
  </label>
  <input type="number" step="5" id="theNumber" min="0" max="400" />
</p>
<p>
  <label for="decrementButton">
    Nhập số bước bạn muốn giảm hoặc để trống:
  </label>
  <input type="number" step="1" id="decrementInput" min="-2" max="15" />
</p>
<input type="button" value="Giảm" id="theButton" />
```

### JavaScript

```js
/* khiến nút gọi hàm */
let button = document.getElementById("theButton");
button.addEventListener("click", () => {
  stepOnDown();
});

function stepOnDown() {
  let input = document.getElementById("theNumber");
  let val = document.getElementById("decrementInput").value;

  if (val) {
    // giảm với tham số
    input.stepDown(val);
  } else {
    // hoặc không có tham số. Thử với 0, 5, -2, v.v.
    input.stepDown();
  }
}
```

### CSS

```css
input:invalid {
  border: red solid 3px;
}
```

### Kết quả

{{EmbedLiveSample("Examples")}}

Lưu ý nếu bạn không truyền tham số cho phương thức `stepDown()`, nó mặc định là 1. Bất kỳ giá trị nào khác là bội số của giá trị thuộc tính `step`, trong trường hợp này là 5. Nếu chúng ta truyền `4` làm `stepDecrement`, đầu vào sẽ `stepDown` đi `4 * 5`, hay `20`. Nếu tham số là `0`, số sẽ không giảm. Phương thức `stepDown()` sẽ không cho phép đầu vào ra ngoài phạm vi, trong trường hợp này dừng khi đạt 0 và làm tròn xuống các số thập phân được truyền làm tham số.

Thử đặt đầu vào step decrement thành `1.2`. Điều gì xảy ra khi gọi phương thức?

Thử đặt giá trị thành `44`, không hợp lệ. Điều gì xảy ra khi gọi phương thức?

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTMLElement("input")}}
- {{domxref("HTMLInputElement")}}
- {{domxref("HTMLInputElement.stepUp", "HTMLInputElement.stepUp()")}}
- Các thuộc tính [`step`](/en-US/docs/Web/HTML/Reference/Attributes/step), [`min`](/en-US/docs/Web/HTML/Reference/Attributes/min) và [`max`](/en-US/docs/Web/HTML/Reference/Attributes/max)
