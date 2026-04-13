---
title: "HTMLInputElement: phương thức stepUp()"
short-title: stepUp()
slug: Web/API/HTMLInputElement/stepUp
page-type: web-api-instance-method
browser-compat: api.HTMLInputElement.stepUp
---

{{APIRef("HTML DOM")}}

Phương thức **`HTMLInputElement.stepUp()`** tăng giá trị của loại đầu vào {{HTMLElement("input")}} số theo giá trị của thuộc tính [`step`](/en-US/docs/Web/HTML/Reference/Attributes/step), hoặc giá trị `step` mặc định nếu thuộc tính step không được đặt rõ ràng. Phương thức, khi được gọi, tăng [`value`](/en-US/docs/Web/HTML/Reference/Elements/input#value) lên ([`step`](/en-US/docs/Web/HTML/Reference/Elements/input#step) \* n), trong đó `n` mặc định là `1` nếu không được chỉ định, và [`step`](/en-US/docs/Web/HTML/Reference/Attributes/step) mặc định là giá trị mặc định cho `step` nếu không được chỉ định.

<table class="no-markdown">
  <thead>
    <tr>
      <th>Loại đầu vào</th>
      <th>Giá trị step mặc định</th>
      <th>Ví dụ khai báo step</th>
    </tr>
    <tr>
      <td>{{HTMLElement("input/date", "date")}}</td>
      <td><code>1</code> (ngày)</td>
      <td>
        Tăng 7 ngày (một tuần):<br />
        <code>&#x3C;input type="date" min="2019-12-25" step="7"></code>
      </td>
    </tr>
    <tr>
      <td>{{HTMLElement("input/month", "month")}}</td>
      <td><code>1</code> (tháng)</td>
      <td>
        Tăng 12 tháng (một năm):<br />
        <code>&#x3C;input type="month" min="2019-12" step="12"></code>
      </td>
    </tr>
    <tr>
      <td>{{HTMLElement("input/week", "week")}}</td>
      <td><code>1</code> (tuần)</td>
      <td>
        Tăng hai tuần:<br />
        <code>&#x3C;input type="week" min="2019-W23" step="2"></code>
      </td>
    </tr>
    <tr>
      <td>{{HTMLElement("input/time", "time")}}</td>
      <td><code>60</code> (giây)</td>
      <td>
        Tăng 900 giây (15 phút):<br />
        <code>&#x3C;input type="time" min="09:00" step="900"></code>
      </td>
    </tr>
    <tr>
      <td>
        {{HTMLElement("input/datetime-local", "datetime-local")}}
      </td>
      <td><code>1</code> (ngày)</td>
      <td>
        Cùng ngày trong tuần:<br />
        <code>&#x3C;input type="datetime-local" min="019-12-25T19:30"
          step="7"></code>
      </td>
    </tr>
    <tr>
      <td>{{HTMLElement("input/number", "number")}}</td>
      <td><code>1</code></td>
      <td>
        Tăng 0.1<br />
        <code>&#x3C;input type="number" min="0" step="0.1" max="10"></code>
      </td>
    </tr>
    <tr>
      <td>{{HTMLElement("input/range", "range")}}</td>
      <td><code>1</code></td>
      <td>
        Tăng theo 2:<br />
        <code>&#x3C;input type="range" min="0" step="2" max="10"></code>
      </td>
    </tr>
  </thead>
</table>

Phương thức, khi được gọi, thay đổi giá trị của điều khiển biểu mẫu theo giá trị được cho trong thuộc tính `step`, nhân với tham số, trong các ràng buộc được đặt trên điều khiển biểu mẫu. Giá trị mặc định cho tham số, nếu không có giá trị nào được truyền, là `1`. Phương thức sẽ không làm cho giá trị vượt quá giá trị [`max`](/en-US/docs/Web/HTML/Reference/Attributes/max) được đặt, hoặc vi phạm các ràng buộc do thuộc tính [`step`](/en-US/docs/Web/HTML/Reference/Attributes/step) đặt ra.

Nếu giá trị trước khi gọi phương thức `stepUp()` không hợp lệ—ví dụ: nếu nó không phù hợp với các ràng buộc do thuộc tính step đặt ra—việc gọi phương thức `stepUp()` sẽ trả về giá trị phù hợp với các ràng buộc của điều khiển biểu mẫu.

Nếu điều khiển biểu mẫu không phải là thời gian, ngày hoặc số, và do đó không hỗ trợ thuộc tính `step` (xem danh sách các loại đầu vào được hỗ trợ trong bảng trên), hoặc nếu giá trị step được đặt thành `any`, ngoại lệ `InvalidStateError` sẽ được ném ra.

## Cú pháp

```js-nolint
stepUp()
stepUp(stepIncrement)
```

### Tham số

- `stepIncrement` {{optional_inline}}
  - : Một giá trị số. Nếu không có tham số được truyền, `stepIncrement` mặc định là `1`.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

Nhấp vào nút trong ví dụ này để tăng loại đầu vào {{HTMLElement("input/number", "number")}}:

### HTML

```html
<p>
  <label for="theNumber">
    Nhập một số từ 0 đến 400 chia hết cho 5:
  </label>
  <input type="number" step="5" id="theNumber" min="0" max="400" />
</p>
<p>
  <label>
    Nhập số bước bạn muốn tăng hoặc để trống:
  </label>
  <input type="number" step="1" id="incrementInput" min="0" max="25" />
</p>
<input type="button" value="Tăng" id="theButton" />
```

### JavaScript

```js
/* khiến nút gọi hàm */
const button = document.getElementById("theButton");
button.addEventListener("click", () => {
  stepOnUp();
});

function stepOnUp() {
  let input = document.getElementById("theNumber");
  let val = document.getElementById("incrementInput").value;

  if (val) {
    /* tăng với tham số */
    input.stepUp(val);
  } else {
    /* hoặc không có tham số. Thử với 0 */
    input.stepUp();
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

Lưu ý nếu bạn không truyền tham số cho phương thức `stepUp`, nó mặc định là `1`. Bất kỳ giá trị nào khác là bội số của giá trị thuộc tính `step`, trong trường hợp này là `5`. Nếu bạn truyền `4` làm `stepIncrement`, đầu vào sẽ `stepUp` lên `4 * 5`, hay `20`. Nếu tham số là `0`, số sẽ không tăng. stepUp sẽ không cho phép đầu vào ra ngoài phạm vi, trong trường hợp này dừng khi đạt `400`, và làm tròn xuống các số thập phân được truyền làm tham số.

Thử đặt đầu vào step increment thành `1.2`. Điều gì xảy ra khi gọi phương thức?

Thử đặt giá trị thành `4`, không hợp lệ. Điều gì xảy ra khi gọi phương thức?

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTMLElement("input")}}
- {{domxref("HTMLInputElement")}}
- {{domxref("HTMLInputElement.stepDown")}}
- Các thuộc tính [`step`](/en-US/docs/Web/HTML/Reference/Attributes/step), [`min`](/en-US/docs/Web/HTML/Reference/Attributes/min) và [`max`](/en-US/docs/Web/HTML/Reference/Attributes/max)
