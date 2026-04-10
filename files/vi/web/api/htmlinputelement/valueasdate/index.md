---
title: "HTMLInputElement: thuộc tính valueAsDate"
short-title: valueAsDate
slug: Web/API/HTMLInputElement/valueAsDate
page-type: web-api-instance-property
browser-compat: api.HTMLInputElement.valueAsDate
---

{{ APIRef("HTML DOM") }}

Thuộc tính **`valueAsDate`** của giao diện {{DOMxRef("HTMLInputElement")}} đại diện cho giá trị hiện tại của phần tử {{htmlelement("input")}} dưới dạng {{jsxref("Date")}}, hoặc `null` nếu chuyển đổi không khả thi.

Thuộc tính này cũng có thể được đặt trực tiếp, ví dụ: để đặt ngày mặc định dựa trên một điều kiện nào đó. Nếu giá trị được cung cấp không phải là `null` hoặc đối tượng `Date`, một {{jsxref("TypeError")}} sẽ được ném ra. Nếu giá trị được cung cấp là `null` hoặc [ngày không hợp lệ](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#the_epoch_timestamps_and_invalid_date), giá trị đầu vào được đặt thành chuỗi rỗng.

Thuộc tính này luôn trả về `null` khi truy cập trên đầu vào không dựa trên ngày hoặc thời gian. Khi đặt thuộc tính này trên đầu vào như vậy, ngoại lệ `InvalidStateError` {{domxref("DOMException")}} sẽ được ném ra.

## Giá trị

Một đối tượng {{jsxref("Date")}} hoặc `null` nếu không thể chuyển đổi. Ngày được trả về nên luôn được hiểu là thời gian UTC—ví dụ: sử dụng các phương thức như `getUTCDate()` thay vì `getDate()`. Nếu bạn không cẩn thận, kết quả có thể sai 1 ngày—ví dụ: nếu người dùng sống ở múi giờ UTC âm (ví dụ: Mỹ), thì việc hiểu ngày là ngày cục bộ sẽ dẫn đến ngày trước ngày người dùng chọn.

Các loại đầu vào [`month`](/en-US/docs/Web/HTML/Reference/Elements/input/month), [`date`](/en-US/docs/Web/HTML/Reference/Elements/input/date), và [`week`](/en-US/docs/Web/HTML/Reference/Elements/input/week) trả về ngày UTC đại diện cho thời điểm đầu tiên của khoảng thời gian được nhập—nghĩa là, chúng luôn là nửa đêm theo UTC. Đối với `month`, ngày là ngày đầu tiên của tháng. Đối với `week`, ngày là Thứ Hai của tuần. Loại đầu vào [`time`](/en-US/docs/Web/HTML/Reference/Elements/input/time) luôn có ngày đặt thành `1970-01-01`.

Loại đầu vào [`datetime-local`](/en-US/docs/Web/HTML/Reference/Elements/input/datetime-local) không hỗ trợ thuộc tính `valueAsDate`, vì nó đại diện cho ngày và giờ theo múi giờ địa phương (a [wall clock time](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/PlainDateTime)), nhưng đối tượng `Date` đại diện cho một điểm thời gian tuyệt đối. Tuy nhiên, một số trình duyệt có thể cung cấp triển khai không chuẩn. [WHATWG đang làm việc để tích hợp](https://github.com/whatwg/html/issues/10882) API {{jsxref("Temporal")}} với các đầu vào ngày/giờ để giải quyết trường hợp sử dụng này.

## Ví dụ

### Lấy giá trị ngày

Ví dụ này minh họa việc truy cập thuộc tính `valueAsDate` trên `<input>` loại {{HTMLElement("input/week", "week")}}.

#### HTML

Chúng ta bao gồm một `<input>` loại `week`:

```html
<label for="date">Chọn ngày và giờ:</label>

<input name="date" id="date" type="week" />

<pre id="log"></pre>
```

#### JavaScript

Khi không có ngày hoặc giờ được chọn, đầu vào trống giải quyết thành `null`. Mỗi khi một lựa chọn được thực hiện, sự kiện {{domxref("HTMLElement/change_event", "change")}} được kích hoạt, cập nhật nội dung `<pre>` hiển thị {{DOMXref("HTMLInputElement.value")}} của điều khiển biểu mẫu so với giá trị đó dưới dạng ngày.

```js
const logElement = document.getElementById("log");
const inputElement = document.getElementById("date");

logElement.innerText = `Giá trị ban đầu: ${inputElement.valueAsDate}`;

inputElement.addEventListener("change", () => {
  logElement.innerText = `${inputElement.value} giải quyết thành ${inputElement.valueAsDate}`;
});
```

```css hidden
#log {
  height: 20px;
  padding: 0.5rem;
  background-color: #ededed;
}
```

#### Kết quả

{{EmbedLiveSample("Retrieving a date value", "", 100)}}

### Sử dụng các phương thức Date

Ví dụ này minh họa việc áp dụng trực tiếp các phương thức {{jsxref("Date")}} cho thuộc tính `valueAsDate` của `<input>` loại {{HTMLElement("input/date", "date")}}.

#### HTML

Chúng ta bao gồm một `<input>` loại `date`:

```html
<label for="date2">Chọn một ngày:</label>

<input name="date2" id="date2" type="date" />

<pre id="log"></pre>
```

#### JavaScript

Khi không có ngày nào được chọn, chuỗi rỗng giải quyết thành `null`. Mỗi khi một lựa chọn được thực hiện, sự kiện {{domxref("HTMLElement/change_event", "change")}} được kích hoạt. Sau đó chúng ta điền nhật ký với ngày đã chọn, được định dạng bằng phương thức {{jsxref("Date.prototype.toLocaleDateString()", "toLocaleDateString()")}} của đối tượng `Date`.

```js
const logElement = document.getElementById("log");
const inputElement = document.getElementById("date2");
const options = {
  weekday: "long",
  year: "numeric",
  month: "long",
  day: "numeric",
};

logElement.innerText = `Giá trị ban đầu: ${inputElement.valueAsDate}`;

inputElement.addEventListener("change", () => {
  if (inputElement.valueAsDate !== null) {
    logElement.innerText = `Bạn đã chọn ${inputElement.valueAsDate.toLocaleDateString("en-US", options)}`;
  } else {
    logElement.innerText = `${inputElement.value} giải quyết thành ${inputElement.valueAsDate}`;
  }
});
```

```css hidden
#log {
  height: 20px;
  padding: 0.5rem;
  background-color: #ededed;
}
```

#### Kết quả

{{EmbedLiveSample("Using Date methods", "", 100)}}

Ngày có thể sai một ngày do múi giờ địa phương của bạn.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTMLElement("input")}}
- {{DOMXref("HTMLInputElement.value")}}
- {{DOMXref("HTMLInputElement.valueAsNumber")}}
