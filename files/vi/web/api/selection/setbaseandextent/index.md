---
title: "Selection: phương thức setBaseAndExtent()"
short-title: setBaseAndExtent()
slug: Web/API/Selection/setBaseAndExtent
page-type: web-api-instance-method
browser-compat: api.Selection.setBaseAndExtent
---

{{ ApiRef("DOM") }}

Phương thức **`setBaseAndExtent()`** của giao diện {{domxref("Selection")}} đặt vùng chọn thành một range bao gồm toàn bộ hoặc một phần của hai nút DOM đã chỉ định, cùng với mọi nội dung nằm giữa chúng.

Anchor và focus node có thể nằm trong một {{glossary("shadow tree")}}, nếu trình duyệt hỗ trợ.

## Cú pháp

```js-nolint
setBaseAndExtent(anchorNode, anchorOffset, focusNode, focusOffset)
```

### Tham số

- `anchorNode`
  - : Nút ở đầu vùng chọn.
- `anchorOffset`
  - : Số lượng nút con tính từ đầu anchor node sẽ bị loại khỏi vùng chọn.
    Ví dụ, nếu giá trị là 0 thì toàn bộ nút được bao gồm.
    Nếu giá trị là 1, toàn bộ nút trừ nút con đầu tiên sẽ được bao gồm.
    Và cứ tiếp tục như vậy.

    Nếu `anchorNode` là nút {{domxref("Text")}}, độ lệch sẽ chỉ số lượng ký tự từ đầu {{domxref("Node.textContent")}} sẽ bị loại khỏi vùng chọn.

- `focusNode`
  - : Nút ở cuối vùng chọn.
- `focusOffset`
  - : Số lượng nút con tính từ đầu focus node sẽ được bao gồm trong vùng chọn.
    Ví dụ, nếu giá trị là 0 thì toàn bộ nút bị loại khỏi vùng chọn.
    Nếu giá trị là 1, nút con đầu tiên sẽ được bao gồm. Và cứ tiếp tục như vậy.

    Nếu `focusNode` là nút {{domxref("Text")}}, độ lệch sẽ chỉ số lượng ký tự từ đầu {{domxref("Node.textContent")}} sẽ được bao gồm trong vùng chọn.

> [!NOTE]
> Nếu vị trí focus xuất hiện trước vị trí anchor trong tài liệu, hướng của vùng chọn sẽ bị đảo ngược — caret được đặt ở đầu văn bản thay vì cuối, điều này quan trọng với mọi lệnh bàn phím có thể theo sau.
> Ví dụ, <kbd>Shift</kbd> + <kbd>➡︎</kbd> sẽ làm vùng chọn thu hẹp từ đầu thay vì mở rộng ở cuối.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- `IndexSizeError` {{domxref("DOMException")}}
  - : Được ném ra nếu `anchorOffset` lớn hơn số lượng nút con bên trong `anchorNode`, hoặc nếu `focusOffset` lớn hơn số lượng nút con bên trong `focusNode`.

## Ví dụ

Trong ví dụ này, chúng ta có hai đoạn văn chứa các span, mỗi span chứa một từ.
Đoạn đầu tiên được đặt làm `anchorNode` và đoạn thứ hai được đặt làm `focusNode`.
Chúng ta cũng có một đoạn bổ sung nằm giữa hai nút.

Tiếp theo, chúng ta có hai ô nhập form cho phép đặt `anchorOffset` và `focusOffset` — cả hai đều có giá trị mặc định là 0.

Chúng ta cũng có một nút, khi được bấm sẽ gọi một hàm chạy phương thức `setBaseAndExtent()` với các độ lệch đã chỉ định, rồi sao chép vùng chọn vào đoạn đầu ra ở cuối HTML.

```html
<h1>setBaseAndExtent example</h1>
<div>
  <p class="one">
    <span>Fish</span><span>Dog</span><span>Cat</span><span>Bird</span>
  </p>
  <p>MIDDLE</p>
  <p class="two">
    <span>Car</span><span>Bike</span><span>Boat</span><span>Plane</span>
  </p>
</div>

<div>
  <p>
    <label for="aOffset">Anchor offset</label>
    <input id="aOffset" name="aOffset" type="number" value="0" />
  </p>
  <p>
    <label for="fOffset">Focus offset</label>
    <input id="fOffset" name="fOffset" type="number" value="0" />
  </p>
  <p><button>Capture selection</button></p>
</div>

<p><strong>Output</strong>: <span class="output"></span></p>
```

> [!NOTE]
> Cố ý không có [whitespace](/en-US/docs/Web/CSS/Guides/Text/Whitespace#working_with_whitespace_in_the_dom) giữa các thẻ mở `<p class="one">` và `<p class="two">` cùng các thẻ `<span>` theo sau chúng — để tránh sự xuất hiện của text node làm ảnh hưởng số lượng nút con mong đợi. (Dù các text node đó chỉ chứa whitespace, chúng vẫn là các nút con bổ sung; xem thêm từ [`Node.firstChild` example](/en-US/docs/Web/API/Node/firstChild#example)).

Mã JavaScript trông như sau:

```js
const one = document.querySelector(".one");
const two = document.querySelector(".two");

const aOffset = document.getElementById("aOffset");
const fOffset = document.getElementById("fOffset");

const button = document.querySelector("button");

const output = document.querySelector(".output");

let selection;

button.onclick = () => {
  try {
    selection = document.getSelection();
    selection.setBaseAndExtent(one, aOffset.value, two, fOffset.value);
    const text = selection.toString();
    output.textContent = text;
  } catch (e) {
    output.textContent = e.message;
  }
};
```

Hãy thử ví dụ trực tiếp bên dưới, đặt các giá trị độ lệch khác nhau để xem điều này ảnh hưởng đến vùng chọn như thế nào.

{{ EmbedLiveSample('Examples', '100%', 370) }}

> [!NOTE]
> Bạn có thể tìm thấy [ví dụ này trên GitHub](https://github.com/chrisdavidmills/selection-api-examples/blob/master/setBaseAndExtent.html) ([xem trực tiếp tại đây](https://chrisdavidmills.github.io/selection-api-examples/setBaseAndExtent.html)).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Selection")}}
