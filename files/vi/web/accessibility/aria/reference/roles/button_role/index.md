---
title: "ARIA: vai trò button"
short-title: button
slug: Web/Accessibility/ARIA/Reference/Roles/button_role
page-type: aria-role
spec-urls:
  - https://w3c.github.io/aria/#button
  - https://www.w3.org/WAI/ARIA/apg/patterns/button/examples/button/
sidebar: accessibilitysidebar
---

Vai trò `button` dành cho các phần tử có thể nhấp, kích hoạt một phản hồi khi người dùng tác động. Thêm `role="button"` sẽ nói với trình đọc màn hình rằng phần tử là một nút, nhưng không cung cấp các chức năng nút điển hình khác như sự kiện click và xử lý bàn phím. Bạn có thể tự thêm những thứ này, nhưng nói chung nên dùng {{HTMLElement("button")}} hoặc {{HTMLElement("input")}} với `type="button"` thay thế.

## Mô tả

Vai trò button xác định một phần tử là nút đối với công nghệ hỗ trợ như trình đọc màn hình. Nút là một widget được dùng để thực hiện các hành động như gửi biểu mẫu, mở hộp thoại, hủy một hành động, hoặc thực hiện một lệnh như chèn bản ghi mới hay hiển thị thông tin. Thêm `role="button"` cho công nghệ hỗ trợ biết rằng phần tử là nút, nhưng không cung cấp các chức năng nút thông thường khác như sự kiện click và xử lý bàn phím. Bạn có thể tự thêm những thứ này, nhưng nhìn chung nên dùng {{HTMLElement("button")}} hoặc {{HTMLElement("input")}} với `type="button"` thay thế.

Vai trò `button` này có thể được dùng kết hợp với thuộc tính [`aria-pressed`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-pressed) để [tạo nút chuyển đổi](#toggle_buttons).

```html
<div id="saveChanges" tabindex="0" role="button" aria-pressed="false">Lưu</div>
```

Ví dụ trên tạo một nút có thể nhận tiêu điểm, nhưng cần JavaScript và CSS để thêm hình thức và chức năng của nút. Đây là các tính năng được cung cấp sẵn khi dùng các phần tử {{HTMLElement("button")}} và {{HTMLElement("input")}} với `type="button"`:

```html
<button type="button" id="saveChanges">Lưu</button>
```

> [!NOTE]
> Nếu dùng `role="button"` thay cho các phần tử ngữ nghĩa `<button>` hoặc `<input type="button">`, bạn sẽ cần làm phần tử đó có thể nhận tiêu điểm và định nghĩa các trình xử lý sự kiện cho các sự kiện {{domxref("Element/click_event", "click")}} và {{domxref("Element/keydown_event", "keydown")}}. Điều này bao gồm xử lý các lần nhấn phím <kbd>Enter</kbd> và <kbd>Space</kbd> để xử lý mọi dạng nhập của người dùng. Xem [mã ví dụ chính thức của WAI-ARIA](https://www.w3.org/WAI/ARIA/apg/patterns/button/examples/button/).

Ngoài widget nút thông thường, `role="button"` cũng nên được đưa vào khi tạo nút chuyển đổi hoặc nút menu bằng phần tử không phải button.

Nút chuyển đổi là một nút hai trạng thái, có thể ở trạng thái tắt (không được nhấn) hoặc bật (được nhấn). Các giá trị thuộc tính [`aria-pressed`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-pressed) `true` hoặc `false` xác định một nút là nút chuyển đổi.

Nút menu là một nút điều khiển một menu và có thuộc tính [`aria-haspopup`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-haspopup) được đặt thành `menu` hoặc `true`.

### Tất cả phần tử con đều mang tính trình bày

Có một số loại thành phần giao diện người dùng mà khi được biểu diễn trong API trợ năng của nền tảng thì chỉ có thể chứa văn bản. Các API trợ năng không có cách biểu diễn các phần tử ngữ nghĩa được chứa bên trong `button`. Để xử lý giới hạn này, trình duyệt tự động áp dụng vai trò [`presentation`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/presentation_role) cho tất cả phần tử con của bất kỳ phần tử `button` nào, vì đây là vai trò không hỗ trợ phần tử con ngữ nghĩa.

Ví dụ, hãy xét phần tử `button` sau, có chứa một tiêu đề.

```html
<div role="button"><h3>Tiêu đề của nút của tôi</h3></div>
```

Vì phần tử con của `button` mang tính trình bày, mã sau là tương đương:

```html
<div role="button"><h3 role="presentation">Tiêu đề của nút của tôi</h3></div>
```

Từ góc nhìn của người dùng công nghệ hỗ trợ, tiêu đề không tồn tại vì các đoạn mã trước tương đương với nội dung sau trong [cây khả năng truy cập](/en-US/docs/Glossary/Accessibility_tree):

```html
<div role="button">Tiêu đề của nút của tôi</div>
```

### Các vai trò, trạng thái và thuộc tính WAI-ARIA liên quan

- [`aria-pressed`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-pressed)
  - : Thuộc tính `aria-pressed` xác định nút là nút chuyển đổi. Giá trị của nó mô tả trạng thái của nút. Các giá trị gồm `aria-pressed="false"` khi nút hiện không được nhấn, `aria-pressed="true"` để chỉ nút hiện đang được nhấn, và `aria-pressed="mixed"` nếu nút được xem là chỉ nhấn một phần. Nếu thuộc tính bị bỏ qua hoặc được đặt thành giá trị mặc định `aria-pressed="undefined"`, phần tử không hỗ trợ trạng thái được nhấn.
- [`aria-expanded`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-expanded)
  - : Nếu nút điều khiển một nhóm phần tử khác, trạng thái `aria-expanded` cho biết nhóm được điều khiển hiện đang mở rộng hay thu gọn. Nếu nút có `aria-expanded="false"` thì nhóm hiện chưa mở rộng. Nếu nút có `aria-expanded="true"` thì nó đang mở rộng; nếu `aria-expanded="undefined"` hoặc thuộc tính bị bỏ qua, nó không thể mở rộng.

### Các nút cơ bản

Nút luôn phải có tên truy cập. Với phần lớn nút, tên này sẽ giống với văn bản bên trong nút, nằm giữa thẻ mở và thẻ đóng. Trong một số trường hợp, ví dụ nút được biểu diễn bằng biểu tượng, tên truy cập có thể được cung cấp từ các thuộc tính [`aria-label`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-label) hoặc [`aria-labelledby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-labelledby).

### Nút chuyển đổi

Một nút chuyển đổi thường có hai trạng thái: được nhấn và không được nhấn. Trạng thái thứ ba là mixed có sẵn cho các nút chuyển đổi điều khiển các phần tử khác, chẳng hạn nút chuyển đổi khác hoặc checkbox, mà không phải tất cả đều có cùng giá trị. Việc một phần tử có phải là nút chuyển đổi hay không có thể được chỉ ra bằng thuộc tính [`aria-pressed`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-pressed) ngoài vai trò `button` (nếu phần tử chưa phải là nút nguyên gốc):

- Nếu không dùng `aria-pressed`, hoặc nó được đặt thành trạng thái "undefined", nút không phải là nút chuyển đổi.
- Nếu dùng `aria-pressed="false"` thì nút là một nút chuyển đổi hiện chưa được nhấn.
- Nếu dùng `aria-pressed="true"` thì nút là một nút chuyển đổi hiện đang được nhấn.
- Nếu dùng `aria-pressed="mixed"`, nút được xem là chỉ được nhấn một phần.

Ví dụ, nút tắt tiếng trên một trình phát âm thanh có nhãn "mute" có thể biểu thị rằng âm thanh đang bị tắt bằng cách đặt trạng thái `aria-pressed` thành true. Nhãn của một nút chuyển đổi không nên thay đổi khi trạng thái của nó thay đổi. Trong ví dụ của chúng ta, nhãn vẫn là "Mute" với trình đọc màn hình đọc "Mute toggle button pressed" hoặc "Mute toggle button not pressed" tùy theo giá trị của `aria-pressed`. Nếu thiết kế yêu cầu nhãn nút thay đổi từ "Mute" sang "Unmute", thì nút chuyển đổi sẽ không phù hợp, và thuộc tính `aria-pressed` sẽ bị bỏ qua.

### Tương tác bàn phím

| Phím | Chức năng |
| --- | --- |
| <kbd>Enter</kbd> | Kích hoạt nút. |
| <kbd>Space</kbd> | Kích hoạt nút |

Sau khi nút được kích hoạt, tiêu điểm sẽ được đặt tùy theo kiểu hành động mà nút thực hiện. Ví dụ, nếu nhấp nút để mở một hộp thoại, tiêu điểm nên chuyển tới hộp thoại. Nếu nút đóng hộp thoại, tiêu điểm nên quay lại nút đã mở hộp thoại, trừ khi chức năng được thực hiện trong bối cảnh hộp thoại dẫn hợp lý tới một phần tử khác. Nếu nút làm thay đổi ngữ cảnh hiện tại, chẳng hạn tắt và bật một tệp âm thanh, thì tiêu điểm thường vẫn ở trên nút.

### Các tính năng JavaScript bắt buộc

#### Các trình xử lý sự kiện bắt buộc

Nút có thể được vận hành bởi người dùng chuột, chạm và bàn phím. Với phần tử HTML `<button>` gốc, sự kiện `onclick` của nút sẽ chạy khi người dùng nhấp chuột và khi người dùng nhấn <kbd>Space</kbd> hoặc <kbd>Enter</kbd> trong khi nút đang có tiêu điểm. Nhưng nếu dùng thẻ khác để tạo nút, sự kiện `onclick` chỉ chạy khi được nhấp bằng con trỏ chuột, ngay cả khi đã dùng `role="button"`. Vì vậy, phải thêm các trình xử lý sự kiện phím riêng cho phần tử để nút được kích hoạt khi phím <kbd>Space</kbd> hoặc <kbd>Enter</kbd> được nhấn.

- `onclick`
  - : Xử lý sự kiện phát sinh khi nút được kích hoạt bằng nhấp chuột hoặc sự kiện chạm.
- `onKeyDown`
  - : Xử lý sự kiện phát sinh khi nút được kích hoạt bằng phím Enter hoặc Space trên bàn phím. (Lưu ý không phải [onKeyPress đã ngừng dùng](/en-US/docs/Web/API/Element/keypress_event))

## Ví dụ

### Ví dụ nút cơ bản

Trong ví dụ này, một phần tử span đã được gán vai trò `button`. Vì dùng phần tử `<span>`, thuộc tính `tabindex` là bắt buộc để làm cho nút có thể nhận tiêu điểm và nằm trong thứ tự tab của trang. CSS đi kèm được cung cấp để làm cho phần tử `<span>` trông giống nút và cung cấp dấu hiệu trực quan khi nút có tiêu điểm.

Các trình xử lý sự kiện `handleBtnClick` và `handleBtnKeyDown` thực hiện hành động của nút khi được kích hoạt bằng nhấp chuột hoặc phím <kbd>Space</kbd> hay <kbd>Enter</kbd>. Trong trường hợp này, hành động là thêm một tên mới vào danh sách tên.

Hãy thử ví dụ bằng cách thêm một tên vào hộp văn bản. Nút sẽ làm tên đó được thêm vào danh sách.

#### HTML

```html
<h1>Ví dụ nút ARIA</h1>
<ul id="nameList"></ul>
<label for="newName">Nhập tên của bạn: </label>
<input type="text" id="newName" />
<span role="button" tabindex="0">Thêm tên</span>
```

#### CSS

```css
[role="button"] {
  padding: 2px;
  background-color: navy;
  color: white;
  cursor: default;
}
[role="button"]:hover,
[role="button"]:focus,
[role="button"]:active {
  background-color: white;
  color: navy;
}
ul {
  list-style: none;
}
```

#### JavaScript

```js
function handleCommand(event) {
  // Xử lý cả nhấp chuột lẫn kích hoạt bằng bàn phím
  // với Enter hoặc Space

  // Các lần nhấn phím khác Enter và Space không nên kích hoạt lệnh
  if (
    event instanceof KeyboardEvent &&
    event.key !== "Enter" &&
    event.key !== " "
  ) {
    return;
  }

  // Lấy giá trị tên mới từ phần tử input
  const newNameInput = document.getElementById("newName");
  const name = newNameInput.value;
  newNameInput.value = ""; // xóa trường văn bản
  newNameInput.focus(); // đưa tiêu điểm trở lại trường văn bản để nhập thêm tên.

  // Không thêm mục trống vào danh sách.
  if (name.length > 0) {
    const listItem = document.createElement("li");
    listItem.appendChild(document.createTextNode(name));

    // Thêm tên mới vào danh sách.
    const list = document.getElementById("nameList");
    list.appendChild(listItem);
  }
}

const btn = document.querySelector("span[role='button']");
btn.addEventListener("click", handleCommand);
btn.addEventListener("keydown", handleCommand);
```

{{EmbedLiveSample("Basic_button_example")}}

### Ví dụ nút chuyển đổi

Trong đoạn này, một phần tử {{HTMLElement("span")}} được chuyển thành nút chuyển đổi bằng vai trò `button` và thuộc tính `aria-pressed`. Khi nút được kích hoạt, giá trị `aria-pressed` sẽ đổi trạng thái; chuyển từ `true` sang `false` rồi quay lại.

#### HTML

```html
<button type="button">Tắt tiếng âm thanh</button>

<span role="button" tabindex="0" aria-pressed="false"> Tắt tiếng âm thanh </span>

<audio
  id="audio"
  src="https://soundbible.com/mp3/Tyrannosaurus%20Rex%20Roar-SoundBible.com-807702404.mp3">
  Trình duyệt của bạn không hỗ trợ phần tử `audio`.
</audio>
```

#### CSS

```css
button,
[role="button"] {
  padding: 3px;
  border: 2px solid transparent;
}

button:active,
button:focus,
[role="button"][aria-pressed="true"] {
  border: 2px solid black;
}
```

#### JavaScript

```js
function handleBtnClick(event) {
  toggleButton(event.target);
}

function handleBtnKeyDown(event) {
  // Kiểm tra xem có nhấn space hay enter không
  // "Spacebar" để hỗ trợ IE11
  if (event.key === " " || event.key === "Enter" || event.key === "Spacebar") {
    // Ngăn hành động mặc định để dừng cuộn khi nhấn space
    event.preventDefault();
    toggleButton(event.target);
  }
}

function toggleButton(element) {
  const audio = document.getElementById("audio");

  // Kiểm tra xem nút có đang được nhấn không
  const pressed = element.getAttribute("aria-pressed") === "true";

  // Đổi aria-pressed sang trạng thái ngược lại
  element.setAttribute("aria-pressed", !pressed);

  // Chuyển đổi trạng thái phát của tệp âm thanh
  if (pressed) {
    audio.pause();
  } else {
    audio.play();
  }
}

const button = document.querySelector("button");
const spanButton = document.querySelector("span[role='button']");
button.addEventListener("click", handleBtnClick);
button.addEventListener("keydown", handleBtnKeyDown);
spanButton.addEventListener("click", handleBtnClick);
spanButton.addEventListener("keydown", handleBtnKeyDown);
```

#### Kết quả
