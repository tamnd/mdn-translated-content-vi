---
title: Hộp danh sách select có thể tùy chỉnh
short-title: Customizable listboxes
slug: Learn_web_development/Extensions/Forms/Customizable_select_listboxes
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Extensions/Forms/Customizable_select", "Learn_web_development/Extensions/Forms/UI_pseudo-classes", "Learn_web_development/Extensions/Forms")}}

Bài viết này tiếp theo bài trước, và xem xét cách tạo kiểu cho các phần tử {{htmlelement("select")}} hộp danh sách có thể tùy chỉnh.

Một trong những ưu điểm lớn của hộp danh sách `<select>` có thể tùy chỉnh so với các hộp danh sách select "cổ điển" là bạn có thể tạo kiểu đầy đủ cho tất cả các phần của điều khiển, và bạn có thể bao gồm nhiều loại phần tử con hơn bên trong chúng, điều đó có nghĩa là tính linh hoạt lớn hơn về mặt thiết kế và chức năng.

## Hộp danh sách select vs danh sách thả xuống select

Trong bài viết trước, chúng ta đã nói về các phần tử `<select>` "dropdown" — các điều khiển có nút khi được nhấn sẽ hiển thị trình chọn thả xuống từ đó bạn có thể chọn một tùy chọn. Chúng được chỉ định bằng HTML cơ bản như `<select>`.

Các phần tử `<select>` "listbox" ngược lại là các điều khiển có hộp hiển thị nhiều tùy chọn cùng một lúc, từ đó bạn có thể chọn một hoặc nhiều tùy chọn. Bạn chọn vào hiển thị select "listbox" bằng cách chỉ định thuộc tính `multiple` (để cho phép nhiều lựa chọn) và/hoặc giá trị `size` lớn hơn `1`. Ví dụ, `<select multiple>` hoặc `<select size="3">`.

Ví dụ trực tiếp sau đây minh họa sự khác biệt:

```html hidden live-sample___select-comparison
<form>
  <p>
    <label for="pet-select">Select pet dropdown:</label><br />
    <select id="pet-select">
      <option value="cat">Cat</option>
      <option value="dog">Dog</option>
      <option value="chicken">Chicken</option>
      <option value="fish">Fish</option>
      <option value="Hamster">Hamster</option>
    </select>
  </p>
  <p>
    <label for="pet-select2">Select pets listbox:</label><br />
    <select id="pet-select2" multiple>
      <option value="cat">Cat</option>
      <option value="dog">Dog</option>
      <option value="chicken">Chicken</option>
      <option value="fish">Fish</option>
      <option value="hamster">Hamster</option>
    </select>
  </p>
</form>
```

```css hidden live-sample___select-comparison
select,
::picker(select) {
  appearance: base-select;
}

form {
  display: flex;
  gap: 100px;
  justify-content: center;
}
```

{{EmbedLiveSample("select-comparison", "100%", "200px")}}

> [!NOTE]
> Thuộc tính `multiple`, cũng như bất kỳ giá trị `size` nào lớn hơn `1`, chọn phần tử `<select>` vào chế độ listbox.

### Hộp danh sách có thể tùy chỉnh so sánh với danh sách thả xuống có thể tùy chỉnh như thế nào?

Hộp danh sách `<select>` có thể tùy chỉnh dễ tạo kiểu hơn biến thể dropdown:

- Không có trình chọn thả xuống, vì vậy bạn không cần lo lắng về việc tạo kiểu cho nó với phần tử giả {{cssxref("::picker()", "::picker(select)")}} hoặc các trạng thái {{cssxref(":open")}} và đóng của nó.
- Bạn không cần lo lắng về việc tạo kiểu biểu tượng nút select bằng cách sử dụng {{cssxref("::picker-icon")}}, hoặc thao tác cách `<option>` hiện đang được chọn được hiển thị bên trong nút bằng cách sử dụng phần tử {{htmlelement("selectedcontent")}}.
- Chỉ có một container duy nhất liên quan; bạn không cần lo lắng về vị trí của trình chọn tương đối với nút.

## Hộp danh sách tùy chỉnh cơ bản

Hãy đi qua một ví dụ cơ bản để cho thấy cách triển khai hộp danh sách tùy chỉnh. Đánh dấu cho ví dụ này trông như sau:

```html live-sample___basic-listbox live-sample___expanding-listbox
<p>
  <label for="pet-select">Select pets:</label><br />
  <select id="pet-select" multiple>
    <option value="cat">Cat</option>
    <option value="dog">Dog</option>
    <option value="chicken">Chicken</option>
    <option value="fish">Fish</option>
    <option value="hamster">Hamster</option>
  </select>
</p>
```

Không có gì đáng chú ý ở đây. Lưu ý rằng chúng ta đang hiển thị hộp danh sách của mình bằng cách sử dụng `<select multiple>` thay vì `<select size="3">`. Sự khác biệt duy nhất là chúng ta có thể chọn nhiều tùy chọn thay vì một tùy chọn đơn. Tạo kiểu hoạt động hoàn toàn giống nhau.

Chúng ta bắt đầu tạo kiểu bằng cách chọn tham gia `<select>` vào tạo kiểu tùy chỉnh với giá trị {{cssxref("appearance")}} là `base-select`:

```css hidden live-sample___basic-listbox live-sample___expanding-listbox live-sample___horizontal-listbox
* {
  box-sizing: border-box;
}

html {
  font-family: Arial, Helvetica, sans-serif;
}
```

```css live-sample___basic-listbox live-sample___expanding-listbox live-sample___horizontal-listbox
select {
  appearance: base-select;
}
```

Sau khi hoàn thành, chúng ta có thể tạo kiểu cho các phần tử {{htmlelement("select")}} và {{htmlelement("option")}} theo bất kỳ cách nào chúng ta muốn.

Các kiểu cơ bản của chúng ta trông như thế này:

```css live-sample___basic-listbox live-sample___expanding-listbox live-sample___horizontal-listbox
select {
  border: 2px solid #ddd;
  border-radius: 8px;
  background: #eee;
  width: 200px;
  height: 130px;
}

option {
  background: #eee;
  padding: 10px;
  height: 40px;
  outline: none;
}

option:nth-of-type(odd) {
  background: #fff;
}
```

Tiếp theo, chúng ta đặt giá trị {{cssxref("order")}} là `1` trên phần tử giả {{cssxref("::checkmark")}} để làm cho dấu kiểm tra cho các tùy chọn được chọn xuất hiện ở bên phải thay vì bên trái, và đặt biểu tượng dấu kiểm tra tùy chỉnh bằng cách sử dụng thuộc tính {{cssxref("content")}}.

```css live-sample___basic-listbox live-sample___expanding-listbox
option::checkmark {
  order: 1;
  margin-left: auto;
  content: "☑️";
}
```

Cuối cùng, chúng ta đặt {{cssxref("font-weight")}} `bold` trên các tùy chọn {{cssxref(":checked")}}, và màu {{cssxref("background")}} tùy chỉnh cho trạng thái {{cssxref(":hover")}} và {{cssxref(":focus")}} của tùy chọn để bạn luôn biết tùy chọn bạn đã di chuột lên hoặc tập trung vào.

```css live-sample___basic-listbox live-sample___expanding-listbox
option:checked {
  font-weight: bold;
}

option:hover,
option:focus {
  background: plum;
}
```

Ví dụ này hiển thị như sau:

{{EmbedLiveSample("basic-listbox", "100%", "200px")}}

## Các biến thể kiểu hộp danh sách

Vì các hộp danh sách tùy chỉnh chỉ là các phần tử HTML tiêu chuẩn, bạn có thể tạo kiểu cho chúng theo bất kỳ cách nào bạn muốn. Trong phần này, chúng tôi cho bạn thấy một vài biến thể trên ví dụ trước. Cả hai sử dụng đánh dấu giống nhau hoặc tương tự; chúng ta đã thêm một chút CSS bổ sung để thay đổi đáng kể giao diện và cảm giác.

### Hộp danh sách mở rộng

Trong ví dụ này, chúng ta trình bày hộp danh sách ở {{cssxref("height")}} của một tùy chọn đơn theo mặc định, ẩn {{cssxref("overflow")}} mà điều này tạo ra, và thêm một {{cssxref("transition")}} để hoạt hình mượt mà chiều cao `<select>` khi trạng thái của nó thay đổi. Chúng ta cũng đặt giá trị {{cssxref("interpolate-size")}} là `allow-keywords` để chọn trình duyệt vào hoạt hình giữa các độ dài và từ khóa.

```css live-sample___expanding-listbox
select {
  height: 44px;
  overflow: hidden;
  transition: 0.6s height;
  interpolate-size: allow-keywords;
}
```

Chúng ta thay đổi `height` thành `fit-content` khi `<select>` được di chuột lên hoặc tập trung vào để nó mở rộng đến chiều cao đầy đủ của nó. Lưu ý rằng khi bạn tab vào một select tùy chỉnh, `<option>` đầu tiên nhận được tiêu điểm thay vì bản thân `<select>`. Do đó, chúng ta phải sử dụng `select:has(option:focus)` để chọn `<select>` khi `<option>` được tập trung, thay vì chỉ `select:focus`.

```css live-sample___expanding-listbox
select:hover,
select:has(option:focus) {
  height: fit-content;
}
```

Ví dụ bây giờ hiển thị như thế này:

{{EmbedLiveSample("expanding-listbox", "100%", "260px")}}

### Hộp danh sách ngang

Trong ví dụ này, chúng ta trình bày các tùy chọn hộp danh sách theo chiều ngang thay vì chiều dọc.

HTML giống với các ví dụ trước, ngoại trừ chúng ta đã bao gồm `<div>` bao bọc thêm để cho phép chúng ta đặt `width` trên `<select>` và sau đó `width` khác trên bao bọc để tất cả các phần tử `<option>` có thể được giữ trên một dòng và cuộn khi `<select>` trở nên quá hẹp để phù hợp với tất cả chúng.

```html live-sample___horizontal-listbox
<p>
  <label for="pet-select">Select pets:</label><br />
  <select id="pet-select" multiple>
    <div class="wrapper">
      <option value="cat">Cat</option>
      <option value="dog">Dog</option>
      <option value="chicken">Chicken</option>
      <option value="fish">Fish</option>
      <option value="hamster">Hamster</option>
      <option value="gerbil">Gerbil</option>
      <option value="guinea">Guinea pig</option>
    </div>
  </select>
</p>
```

Trong CSS, chúng ta bắt đầu bằng cách đặt {{cssxref("width")}} và {{cssxref("margin")}} của phần tử {{htmlelement("p")}} chứa để demo sẽ được căn giữa theo chiều ngang trong viewport và chiếm hầu hết chiều rộng. Sau đó chúng ta đặt kích thước `<select>` để chiếm toàn bộ chiều rộng của phần tử cha và chỉ cao bằng các phần tử `<option>`. `<div>` `.wrapper` được cung cấp giá trị {{cssxref("display")}} là `flex`, khiến các phần tử `<option>` được bố cục theo chiều ngang trong một hàng; sau đó chúng ta đặt `width` của nó để nó luôn rộng bằng các phần tử `<option>`.

```css live-sample___horizontal-listbox
p {
  width: 90%;
  margin: 0 auto;
}

select {
  width: 100%;
  height: fit-content;
}

.wrapper {
  display: flex;
  width: fit-content;
}
```

Tiếp theo, chúng ta cung cấp cho các phần tử `<option>` một số padding bổ sung để cách nhau theo chiều ngang, và giá trị {{cssxref("position")}} là `relative` để chúng ta có thể định vị các con của chúng tương đối với chúng.

```css live-sample___horizontal-listbox
option {
  padding: 10px 30px;
  position: relative;
}
```

Cuối cùng, chúng ta định vị tuyệt đối các dấu kiểm tra tùy chọn và cung cấp cho chúng giao diện tùy chỉnh.

```css live-sample___horizontal-listbox
option::checkmark {
  position: absolute;
  top: -2px;
  left: 2px;
  font-size: 1.5rem;
  color: red;
  text-shadow: 1px 1px 1px black;
}
```

```css hidden live-sample___horizontal-listbox
option:hover,
option:focus {
  background: plum;
}
```

Biến thể thứ hai của chúng ta hiển thị như thế này:

{{EmbedLiveSample("horizontal-listbox", "100%", "100px")}}

## Hộp danh sách phức tạp hơn

Trong phần này, chúng ta sẽ đi qua một ví dụ phức tạp hơn, cung cấp hộp danh sách chọn liên hệ với trường lọc tích hợp và liên kết để truy cập chế độ chỉnh sửa liên hệ (hư cấu).

### HTML

Trong đánh dấu, chúng ta bao gồm {{htmlelement("form")}} chứa tiêu đề và `<div>` bao bọc. Bên trong bao bọc, chúng ta bao gồm thêm ba phần tử `<div>` lần lượt chứa {{htmlelement("input")}} văn bản đại diện cho trường lọc của chúng ta, hộp danh sách {{htmlelement("select")}} và một liên kết. `<select>` sẽ được điền vào với các phần tử {{htmlelement("option")}} đại diện cho các lựa chọn liên hệ của chúng ta thông qua JavaScript.

```html live-sample___complex-listbox
<form>
  <h2>Contact select</h2>
  <div class="wrapper">
    <div class="filter">
      <input
        type="text"
        aria-label="Filter contacts"
        placeholder="Filter by name, e.g. amara" />
    </div>
    <div class="options">
      <select
        multiple
        name="contact-select"
        aria-label="Select contacts"></select>
    </div>
    <div class="edit">
      <a href="#">Edit contacts</a>
    </div>
  </div>
</form>
```

### CSS

Chúng ta bắt đầu CSS bằng cách chọn tham gia phần tử `<select>` vào tạo kiểu tùy chỉnh, như trước:

```css hidden live-sample___complex-listbox
* {
  box-sizing: border-box;
}

html {
  font-family: Arial, Helvetica, sans-serif;
}
```

```css live-sample___complex-listbox
select {
  appearance: base-select;
}
```

Hầu hết tạo kiểu là khá cơ bản, nhưng chúng ta sẽ đi qua nó, chỉ ra bất cứ điều gì đáng kể trong suốt. Đầu tiên, chúng ta tạo kiểu `<div>` `.wrapper`, cung cấp cho nó {{cssxref("width")}} cố định kiểm soát kích thước ngang của toàn bộ điều khiển.

```css live-sample___complex-listbox
.wrapper {
  border: 2px solid #ddd;
  border-radius: 8px;
  background: #ddd;
  width: 250px;
}
```

Tiếp theo, chúng ta tạo kiểu cho `<input>` lọc, `<div>` `.options` và `<select>` chứa, và `<div>` `.edit` chứa liên kết. Đáng chú ý nhất, chúng ta cung cấp cho `<select>` {{cssxref("height")}} cố định và giá trị {{cssxref("overflow-y")}} là `scroll` để các phần tử `<option>` chứa sẽ cuộn bên trong nó.

```css live-sample___complex-listbox
.filter input {
  display: block;
  padding: 5px;
  border-radius: 5px;
  border: 1px solid #bbb;
  width: 95%;
  margin: 8px auto;
}

.options {
  padding: 0 5px;
  background: #ddd;
}

select {
  height: 200px;
  overflow-y: scroll;
  width: 100%;
  border: 1px solid #bbb;
}

.edit {
  height: 36px;
  display: flex;
  align-items: center;
  justify-content: center;
}
```

Chúng ta tạo kiểu cho các phần tử `<option>` theo cách tương tự như các ví dụ trước, cung cấp kẻ sọc zebra, và kiểu `:hover` và `:focus` rõ ràng:

```css live-sample___complex-listbox
option {
  background: #eee;
  padding: 10px;
}

option:nth-of-type(odd) {
  background: #fff;
}

option:checked {
  font-weight: bold;
}

option:hover,
option:focus {
  background: plum;
}
```

Bước tiếp theo của chúng ta là loại bỏ đường viền focus mặc định cho các phần tử `<input>`, `<option>` và `<a>`. Chúng ta đã cung cấp kiểu thay thế cho các phần tử `<option>` trong khối mã trước; ở đây, chúng ta cung cấp các phương án thay thế tinh tế hơn cho các phần tử `<input>` và `<a>`.

```css live-sample___complex-listbox
input,
option,
a {
  outline: none;
}

input:hover,
input:focus {
  border: 1px solid #999;
  background: #eef;
}

.edit a {
  color: #333;
}

a:hover,
a:focus {
  outline: 2px dotted #666;
}
```

Cuối cùng, chúng ta cung cấp tạo kiểu tùy chỉnh cho các dấu kiểm tra của các tùy chọn được chọn thông qua phần tử giả `::checkmark`:

```css live-sample___complex-listbox
option::checkmark {
  order: 1;
  margin-left: auto;
  content: "☑️";
}
```

### JavaScript

Phần bổ sung cuối cùng mà ví dụ của chúng ta cần là một số JavaScript để cung cấp chức năng điền và lọc tùy chọn.

Trong một trang web thực, bạn có thể sẽ kéo danh sách liên hệ cập nhật từ máy chủ, nhưng trong trường hợp này, chúng ta đã cung cấp dữ liệu trong đối tượng `contacts` tĩnh (chúng ta đã ẩn hầu hết các liên hệ để ngắn gọn). Đối với mỗi liên hệ, chúng ta lưu trữ tên và boolean chỉ ra xem họ có được chọn trong phần tử `<select>` không.

```js
const contacts = [
  { name: "Aisha Khan", selected: false },
  // …
];
```

```js hidden live-sample___complex-listbox
const contacts = [
  { name: "Aisha Khan", selected: false },
  { name: "Aisyah Rahman", selected: false },
  { name: "Amara Okafor", selected: false },
  { name: "Ananya Sharma", selected: false },
  { name: "Andrei Popescu", selected: false },
  { name: "Anh Nguyen", selected: false },
  { name: "Arjun Patel", selected: false },
  { name: "Arun Prasetyo", selected: false },
  { name: "Aya Nakamura", selected: false },
  { name: "Benjamin Brown", selected: false },
  { name: "Carlos Mendez", selected: false },
  { name: "Chloe Dubois", selected: false },
  { name: "Clara Fischer", selected: false },
  { name: "Daniel Kim", selected: false },
  { name: "Daniel Muller", selected: false },
  { name: "Diego Alvarez", selected: false },
  { name: "Ethan Williams", selected: false },
  { name: "Fatima Al-Farsi", selected: false },
  { name: "Freya Andersen", selected: false },
  { name: "Gabriel Costa", selected: false },
  { name: "Hannah Cohen", selected: false },
  { name: "Hiroshi Tanaka", selected: false },
  { name: "Isabella Martinez", selected: false },
  { name: "Jakub Novak", selected: false },
  { name: "Jonas Schmidt", selected: false },
  { name: "Kanya Chaiyaporn", selected: false },
  { name: "Kwame Mensah", selected: false },
  { name: "Leila Haddad", selected: false },
  { name: "Lena Gruber", selected: false },
  { name: "Liam O'Connor", selected: false },
  { name: "Liam Silva", selected: false },
  { name: "Lucas Silva", selected: false },
  { name: "Maria Santos", selected: false },
  { name: "Mariam Said", selected: false },
  { name: "Mateo Garcia", selected: false },
  { name: "Maya Chen", selected: false },
  { name: "Maya Nguyen", selected: false },
  { name: "Mohamed Salah", selected: false },
  { name: "Nadia Rahman", selected: false },
  { name: "Nathan Lee", selected: false },
  { name: "Nguyen Minh", selected: false },
  { name: "Noah Kim", selected: false },
  { name: "Oliver Smith", selected: false },
  { name: "Omar Hassan", selected: false },
  { name: "Ravi Reddy", selected: false },
  { name: "Samuel Johnson", selected: false },
  { name: "Sofia Rossi", selected: false },
  { name: "Thomas Anderson", selected: false },
  { name: "Valentina Ivanova", selected: false },
  { name: "Yusuf Demir", selected: false },
];
```

Chúng ta bắt đầu bằng cách lấy tham chiếu đến `<input>` `.filter` và các phần tử `<select>`:

```js live-sample___complex-listbox
const filterInput = document.querySelector(".filter input");
const select = document.querySelector("select");
```

Tiếp theo, chúng ta định nghĩa một hàm gọi là `populateOptions()`, nhận một mảng đối tượng làm tham số. Bên trong hàm, trước tiên chúng ta làm trống nội dung của phần tử `<select>`. Sau đó chúng ta lặp qua mảng đầu vào và tạo phần tử `<option>` cho mỗi đối tượng trong mảng, đặt `textContent` và thuộc tính `selected` của nó bằng thuộc tính `name` và `selected` của đối tượng. Mỗi phần tử `<option>` được thêm vào DOM như là con của `<select>`.

```js live-sample___complex-listbox
function populateOptions(array) {
  select.innerHTML = "";

  array.forEach((obj) => {
    const option = document.createElement("option");
    option.textContent = obj.name;
    option.selected = obj.selected;
    select.appendChild(option);
  });
}
```

Bây giờ chúng ta định nghĩa một hàm khác, `filterOptions()`, nhận một chuỗi lọc và một mảng đối tượng làm tham số. Chúng ta kiểm tra xem chuỗi có bằng chuỗi trống hoặc một hoặc nhiều khoảng cách không bằng cách so sánh giá trị trả về của phương thức {{jsxref("String.trim", "trim()")}} của nó với `""`. Nếu điều này trả về `true`, chúng ta chạy hàm `populateOptions()`, truyền cho nó mảng đầy đủ để `<select>` được điền với tất cả các phần tử `<option>`. Nếu nó trả về `false`, chúng ta lọc mảng đầu vào bằng phương thức {{jsxref("Array.filter", "filter()")}} của nó để chỉ bao gồm các đối tượng có thuộc tính `name` {{jsxref("String.startsWith", "startsWith()")}} chuỗi `filter`, sau đó chúng ta truyền mảng đã lọc cho hàm `populateOptions()` để `<select>` được điền với một tập hợp các phần tử `<option>` đã lọc.

```js live-sample___complex-listbox
function filterOptions(filter, array) {
  if (filter.trim() === "") {
    populateOptions(array);
  } else {
    const filteredArray = array.filter((obj) =>
      obj.name.toLowerCase().startsWith(filter.toLowerCase()),
    );
    populateOptions(filteredArray);
  }
}
```

> [!NOTE]
> Chúng ta chuyển đổi cả `name` đối tượng và chuỗi `filter` sang chữ thường bằng cách sử dụng {{jsxref("String.toLowerCase", "toLowerCase()")}} để khớp lọc không phân biệt chữ hoa chữ thường.

Tiếp theo, chúng ta thêm trình lắng nghe sự kiện {{domxref("Element.input_event", "input")}} vào phần tử `<input>` `.filter` để khi giá trị của nó được chỉnh sửa, nó chạy hàm `filterOptions()` để lọc các phần tử `<option>` được hiển thị. Chúng ta truyền cho nó giá trị hiện tại của `<input>` làm chuỗi lọc, và mảng `contacts` làm mảng đầu vào.

```js live-sample___complex-listbox
filterInput.addEventListener("input", () => {
  filterOptions(filterInput.value, contacts);
});
```

Phần mã tiếp theo thêm trình lắng nghe sự kiện {{domxref("HTMLElement.change_event", "change")}} vào phần tử `<select>` để mỗi khi `<option>` được chọn hoặc bỏ chọn, trạng thái `selected` của các đối tượng trong mảng `contacts` được đồng bộ hóa với trạng thái được chọn của các đối tượng `<option>` hiện đang được hiển thị. Điều này là cần thiết vì mỗi khi chúng ta áp dụng bộ lọc mới cho phần tử `<select>`, các phần tử `<option>` được hiển thị được tạo mới từ mảng `contacts`, bao gồm trạng thái được chọn của chúng. Nếu chúng ta không làm điều này, chúng ta sẽ mất các tùy chọn đã chọn mỗi khi chúng ta thay đổi bộ lọc.

Không có cách nào để phát hiện chính xác `<option>` nào đã được thay đổi mỗi khi một cái được chuyển đổi, vì vậy chúng ta đã giải quyết vấn đề như thế này:

1. Lấy một mảng tất cả các giá trị `<option>` hiện đang được hiển thị bằng cách tạo một mảng từ bộ sưu tập {{domxref("HTMLSelectElement.options", "select.options")}} bằng cách sử dụng {{jsxref("Array.from")}}, sau đó ánh xạ nó bằng phương thức {{jsxref("Array.map", "map()")}} của nó để thay thế mỗi `<option>` trong mảng bằng giá trị của nó.
2. Lấy một mảng tất cả các giá trị `<option>` hiện đang được chọn bằng cách sử dụng cùng phương pháp, ngoại trừ lần này chúng ta tạo mảng đầu vào từ bộ sưu tập {{domxref("HTMLSelectElement.selectedOptions", "select.selectedOptions")}}.
3. Đối với mỗi đối tượng liên hệ trong mảng `contacts`, kiểm tra xem giá trị thuộc tính `name` của liên hệ có được bao gồm trong mảng `allCurrentValues` hay không bằng cách sử dụng phương thức {{jsxref("Array.includes", "includes()")}}. Nếu không, hãy bỏ qua nó, để chúng ta không vô tình chuyển đổi trạng thái được chọn của các liên hệ thậm chí không được hiển thị. Nếu có, đặt thuộc tính `selected` của liên hệ thành kết quả kiểm tra xem mảng `currentSelectedValues` có {{jsxref("Array.includes", "includes()")}} `name` liên hệ hay không — nếu trường hợp này xảy ra, đặt thuộc tính đối tượng thành `true`, hoặc `false` nếu không.

```js live-sample___complex-listbox
select.addEventListener("change", () => {
  const allCurrentValues = Array.from(select.options).map(
    (option) => option.value,
  );
  const currentSelectedValues = Array.from(select.selectedOptions).map(
    (option) => option.value,
  );

  contacts.forEach((contact) => {
    if (allCurrentValues.includes(contact.name)) {
      contact.selected = currentSelectedValues.includes(contact.name);
    }
  });
});
```

Cuối cùng, chúng ta chạy hàm `populateOptions()`, truyền cho nó mảng `contacts`, để khi tải trang, danh sách liên hệ đầy đủ được hiển thị.

```js live-sample___complex-listbox
populateOptions(contacts);
```

### Kết quả

Ví dụ hiển thị như sau:

{{EmbedLiveSample("complex-listbox", "100%", "380px")}}

```css hidden live-sample___basic-listbox live-sample___expanding-listbox live-sample___horizontal-listbox live-sample___complex-listbox
@supports not (appearance: base-select) {
  body::before {
    content: "Your browser does not support `appearance: base-select`.";
    color: black;
    background-color: wheat;
    position: fixed;
    left: 0;
    right: 0;
    top: 40%;
    text-align: center;
    padding: 1rem 0;
    z-index: 1;
  }
}
```

## Tiếp theo

Trong bài viết tiếp theo của mô-đun này, chúng ta sẽ khám phá các [lớp giả giao diện người dùng](/en-US/docs/Learn_web_development/Extensions/Forms/UI_pseudo-classes) khác nhau có sẵn cho chúng ta trong các trình duyệt hiện đại để tạo kiểu biểu mẫu ở các trạng thái khác nhau.

## Xem thêm

- {{htmlelement("select")}}, {{htmlelement("option")}}, {{htmlelement("optgroup")}}, {{htmlelement("label")}}
- {{cssxref("appearance")}}
- {{cssxref("::checkmark")}}
- {{cssxref(":checked")}}
- [Phần tử select có thể tùy chỉnh](/en-US/docs/Learn_web_development/Extensions/Forms/Customizable_select)

{{PreviousMenuNext("Learn_web_development/Extensions/Forms/Customizable_select", "Learn_web_development/Extensions/Forms/UI_pseudo-classes", "Learn_web_development/Extensions/Forms")}}
