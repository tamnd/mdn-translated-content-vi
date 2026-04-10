---
title: "Document: phương thức ariaNotify()"
short-title: ariaNotify()
slug: Web/API/Document/ariaNotify
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.Document.ariaNotify
---

{{ApiRef("DOM")}}{{SeeCompatTable}}

Phương thức **`ariaNotify()`** của giao diện {{domxref("Document")}} chỉ định rằng một chuỗi văn bản nhất định nên được thông báo bởi một {{glossary("screen reader")}} nếu có sẵn và được kích hoạt.

## Cú pháp

```js-nolint
ariaNotify(announcement)
ariaNotify(announcement, options)
```

### Tham số

- `announcement`
  - : Một chuỗi chỉ định văn bản cần được thông báo.
- `options` {{optional_inline}}
  - : Một đối tượng tùy chọn chứa các thuộc tính sau:
    - `priority`
      - : Một giá trị liệt kê chỉ định mức độ ưu tiên của thông báo. Các giá trị có thể là:
        - `normal`
          - : Thông báo có mức độ ưu tiên bình thường. Nó sẽ được đọc sau bất kỳ thông báo nào mà screen reader đang thực hiện.
        - `high`
          - : Thông báo có mức độ ưu tiên cao. Nó sẽ được đọc ngay lập tức, làm gián đoạn bất kỳ thông báo nào mà screen reader đang thực hiện.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Mô tả

Phương thức **`ariaNotify()`** có thể được sử dụng để kích hoạt theo chương trình một thông báo screen reader. Phương thức này cung cấp chức năng tương tự như [ARIA live regions](/en-US/docs/Web/Accessibility/ARIA/Guides/Live_regions), với một số ưu điểm:

- Live regions chỉ có thể đưa ra thông báo sau các thay đổi đối với DOM, trong khi thông báo `ariaNotify()` có thể được thực hiện bất cứ lúc nào.
- Thông báo live region liên quan đến việc đọc nội dung đã cập nhật của nút DOM đã thay đổi, trong khi nội dung thông báo `ariaNotify()` có thể được định nghĩa độc lập với nội dung DOM.

Các nhà phát triển thường khắc phục những hạn chế của live regions bằng cách sử dụng các nút DOM ẩn với live regions được đặt trên chúng, có nội dung được cập nhật với nội dung cần thông báo. Điều này không hiệu quả và dễ xảy ra lỗi, và `ariaNotify()` cung cấp một cách để tránh các vấn đề như vậy.

Một số screen reader sẽ đọc nhiều thông báo `ariaNotify()` theo thứ tự, nhưng điều này không thể được đảm bảo trên tất cả các screen reader và nền tảng. Thông thường, chỉ thông báo gần nhất mới được đọc. Sẽ đáng tin cậy hơn khi kết hợp nhiều thông báo thành một.

Ví dụ: các lời gọi sau:

```js
document.ariaNotify("Hello there.");
document.ariaNotify("The time is now 8 o'clock.");
```

sẽ tốt hơn nếu kết hợp:

```js
document.ariaNotify("Hello there. The time is now 8 o'clock.");
```

Thông báo `ariaNotify()` không yêu cầu {{glossary("transient activation")}}; bạn nên cẩn thận không spam người dùng screen reader với quá nhiều thông báo, vì điều này có thể tạo ra trải nghiệm người dùng tồi tệ.

### Mức độ ưu tiên thông báo

Một thông báo `ariaNotify()` với `priority: high` được thông báo trước một thông báo `ariaNotify()` với `priority: normal`.

Thông báo `ariaNotify()` tương đương gần đúng với thông báo ARIA live region như sau:

- `ariaNotify()` `priority: high`: `aria-live="assertive"`.
- `ariaNotify()` `priority: normal`: `aria-live="polite"`.

Tuy nhiên, thông báo `aria-live` sẽ được ưu tiên hơn thông báo `ariaNotify()`.

### Lựa chọn ngôn ngữ

Screen reader chọn một giọng đọc phù hợp để đọc thông báo `ariaNotify()` (về giọng, cách phát âm, v.v.) dựa trên ngôn ngữ được chỉ định trong thuộc tính [`lang`](/en-US/docs/Web/HTML/Reference/Global_attributes/lang) của phần tử {{htmlelement("html")}}, hoặc ngôn ngữ mặc định của user agent nếu không có thuộc tính `lang` nào được đặt.

### Tích hợp chính sách permissions

Việc sử dụng `ariaNotify()` trong một tài liệu hoặc {{htmlelement("iframe")}} có thể được kiểm soát bởi [Permission Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy) {{httpheader("Permissions-Policy/aria-notify", "aria-notify")}}.

Cụ thể, khi một chính sách đã xác định chặn việc sử dụng, bất kỳ thông báo nào được tạo bằng `ariaNotify()` sẽ thất bại âm thầm (chúng sẽ không được gửi).

## Ví dụ

### Sử dụng cơ bản `ariaNotify()`

Ví dụ này bao gồm một {{htmlelement("button")}} kích hoạt thông báo screen reader khi được nhấp.

```html live-sample___basic-arianotify
<button>Press</button>
```

```css hidden live-sample___basic-arianotify
html,
body {
  height: 100%;
}

body {
  display: flex;
  justify-content: center;
  align-items: center;
}
```

```js live-sample___basic-arianotify
document.querySelector("button").addEventListener("click", () => {
  document.ariaNotify("Hi there, I'm Ed Winchester.");
});
```

#### Kết quả

Đầu ra như sau:

{{EmbedLiveSample("basic-arianotify", "100%", 60, , , , "aria-notify")}}

Hãy thử kích hoạt screen reader và sau đó nhấn nút. Bạn sẽ nghe thấy "Hi there, I'm Ed Winchester." được screen reader đọc.

### Ví dụ danh sách mua sắm có thể tiếp cận

Ví dụ này là một danh sách mua sắm cho phép bạn thêm và xóa các mặt hàng, đồng thời theo dõi tổng chi phí của tất cả các mặt hàng. Khi một mặt hàng được thêm hoặc xóa, screen reader sẽ đọc một thông báo để cho biết mặt hàng nào đã được thêm/xóa và tổng số đã cập nhật là bao nhiêu.

#### HTML

HTML của chúng ta có một {{htmlelement("form")}} chứa hai phần tử {{htmlelement("input")}} — một đầu vào `text` để nhập tên mặt hàng và một đầu vào `number` để nhập giá. Cả hai đầu vào đều [`required`](/en-US/docs/Web/HTML/Reference/Attributes/required), và đầu vào `number` có giá trị [`step`](/en-US/docs/Web/HTML/Reference/Attributes/step) là `0.01` để ngăn các giá trị không phải giá (như số thập phân lớn) được nhập.

Bên dưới form, chúng ta có một [danh sách không có thứ tự](/en-US/docs/Web/HTML/Reference/Elements/ul) để hiển thị các mặt hàng đã thêm và một phần tử {{htmlelement("p")}} để hiển thị tổng chi phí.

```html live-sample___shopping-list
<h1><code>ariaNotify</code> demo: shopping list</h1>

<form>
  <div>
    <label for="item">Enter item name</label>
    <input type="text" name="item" id="item" required />
  </div>
  <div>
    <label for="price">Enter item price</label>
    <input type="number" name="price" id="price" step="0.01" required />
  </div>
  <div>
    <button>Submit</button>
  </div>
</form>

<hr />

<ul></ul>

<p>Total: £0.00</p>
```

```css hidden live-sample___shopping-list
html {
  box-sizing: border-box;
  font: 1.2em / 1.5 system-ui;
}

body {
  width: 600px;
  margin: 0 auto;
}

form {
  padding: 0 50px;
}

div {
  display: flex;
  margin-bottom: 20px;
}

label {
  flex: 2;
}

input {
  flex: 4;
  padding: 5px;
}

form button {
  padding: 5px 10px;
  font-size: 1em;
  border-radius: 10px;
  border: 1px solid gray;
}

li {
  margin-bottom: 10px;
}

li button {
  font-size: 0.6rem;
  margin-left: 10px;
}
```

#### JavaScript

Script của chúng ta bắt đầu với một số định nghĩa hằng số để lưu trữ các tham chiếu đến `<form>`, hai phần tử `<input>` và các phần tử `<ul>` và `<p>`. Chúng ta cũng bao gồm một biến `total` để lưu trữ tổng giá của tất cả các mặt hàng.

```js live-sample___shopping-list
const form = document.querySelector("form");
const item = document.querySelector("input[type='text']");
const price = document.querySelector("input[type='number']");
const priceList = document.querySelector("ul");
const totalOutput = document.querySelector("p");

let total = 0;
```

Trong khối mã tiếp theo, chúng ta định nghĩa một hàm gọi là `updateTotal()` có một công việc duy nhất — nó cập nhật giá hiển thị trong phần tử `<p>` bằng với giá trị hiện tại của biến `total`:

```js live-sample___shopping-list
function updateTotal() {
  totalOutput.textContent = `Total: £${Number(total).toFixed(2)}`;
}
```

Tiếp theo, chúng ta định nghĩa một hàm gọi là `addItemToList()`. Bên trong thân hàm, trước tiên chúng ta tạo một phần tử {{htmlelement("li")}} để lưu trữ một mặt hàng mới được thêm vào. Chúng ta lưu trữ tên và giá mặt hàng trong các thuộc tính [`data-*`](/en-US/docs/Web/HTML/Reference/Global_attributes/data-*) trên phần tử, và đặt nội dung văn bản của nó bằng một chuỗi chứa mặt hàng và giá. Chúng ta cũng tạo một phần tử {{htmlelement("button")}} với văn bản "Remove &lt;item-name>", sau đó thêm mục danh sách vào danh sách không có thứ tự và nút vào mục danh sách.

Phần lớn thứ hai của thân hàm là định nghĩa trình lắng nghe sự kiện `click` trên nút. Khi nút được nhấp, trước tiên chúng ta lấy tham chiếu đến nút cha của nút — mục danh sách mà nó đang ở trong. Sau đó chúng ta trừ số chứa trong thuộc tính `data-price` của mục danh sách khỏi biến `total`, gọi hàm `updateTotal()` để cập nhật tổng giá hiển thị, sau đó gọi `ariaNotify()` để thông báo mặt hàng đã bị xóa và tổng số mới là bao nhiêu. Cuối cùng, chúng ta xóa mục danh sách khỏi DOM.

```js live-sample___shopping-list
function addItemToList(item, price) {
  const listItem = document.createElement("li");
  listItem.setAttribute("data-item", item);
  listItem.setAttribute("data-price", price);
  listItem.textContent = `${item}: £${Number(price).toFixed(2)}`;
  const btn = document.createElement("button");
  btn.textContent = `Remove ${item}`;

  priceList.appendChild(listItem);
  listItem.appendChild(btn);

  btn.addEventListener("click", (e) => {
    const listItem = e.target.parentNode;
    total -= Number(listItem.getAttribute("data-price"));
    updateTotal();
    document.ariaNotify(
      `${listItem.getAttribute(
        "data-item",
      )} removed. Total is now £${total.toFixed(2)}.`,
      {
        priority: "high",
      },
    );
    listItem.remove();
  });
}
```

Khối mã cuối cùng của chúng ta thêm một trình lắng nghe sự kiện `submit` vào `<form>`. Bên trong hàm xử lý, trước tiên chúng ta gọi {{domxref("Event.preventDefault", "preventDefault()")}} trên đối tượng sự kiện để dừng việc gửi form. Sau đó chúng ta gọi `addItemToList()` để hiển thị mặt hàng mới và giá của nó trong danh sách, thêm giá vào biến `total`, gọi `updateTotal()` để cập nhật tổng số hiển thị, sau đó gọi `ariaNotify()` để thông báo mặt hàng đã được thêm và tổng số mới là bao nhiêu. Cuối cùng, chúng ta xóa các giá trị trường đầu vào hiện tại để sẵn sàng cho mặt hàng tiếp theo được thêm vào.

```js live-sample___shopping-list
form.addEventListener("submit", (e) => {
  e.preventDefault();

  addItemToList(item.value, price.value);
  total += Number(price.value);
  updateTotal();

  document.ariaNotify(
    `Item ${item.value}, price £${
      price.value
    }, added to list. Total is now £${total.toFixed(2)}.`,
    {
      priority: "high",
    },
  );

  item.value = "";
  price.value = "";
});
```

#### Kết quả

Đầu ra như sau:

{{EmbedLiveSample("shopping-list", "100%", 500, , , , "aria-notify")}}

Hãy thử kích hoạt screen reader và sau đó thêm và xóa một số mặt hàng. Bạn sẽ nghe thấy chúng được thông báo bởi screen reader.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Element.ariaNotify()")}}
- [ARIA live regions](/en-US/docs/Web/Accessibility/ARIA/Guides/Live_regions)
