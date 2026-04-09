---
title: "ARIA: vai trò radio"
short-title: radio
slug: Web/Accessibility/ARIA/Reference/Roles/radio_role
page-type: aria-role
sidebar: accessibilitysidebar
---

Vai trò `radio` là một trong một nhóm các nút radio có thể đánh dấu, trong một `radiogroup`, nơi không quá một nút radio có thể được chọn tại cùng một thời điểm.

## Mô tả

Một radio button là một input có thể đánh dấu, và khi được liên kết với các radio button khác, chỉ một trong số đó có thể được chọn tại một thời điểm. Các radio button phải được nhóm lại trong một [`radiogroup`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/radiogroup_role) để chỉ ra những phần tử nào cùng ảnh hưởng đến một giá trị.

```html
<div role="radiogroup" aria-labelledby="legend25" id="radiogroup25">
  <p id="legend25">Ipsum and lorem?</p>
  <div>
    <span
      role="radio"
      aria-checked="false"
      tabindex="0"
      aria-labelledby="q25_radio1-label"
      data-value="True"></span>
    <label id="q25_radio1-label">True</label>
  </div>
  <div>
    <span
      role="radio"
      aria-checked="false"
      tabindex="0"
      aria-labelledby="q25_radio2-label"
      data-value="False"></span>
    <label id="q25_radio2-label">False</label>
  </div>
  <div>
    <span
      role="radio"
      aria-checked="true"
      tabindex="0"
      aria-labelledby="q25_radio3-label"
      data-value="huh?"></span>
    <label id="q25_radio3-label">What is the question?</label>
  </div>
</div>
```

Thuộc tính `role` chỉ thêm ngữ nghĩa; toàn bộ chức năng vốn có của [HTML radio](/en-US/docs/Web/HTML/Reference/Elements/input/radio) cần được thêm bằng JavaScript và thuộc tính HTML [`tabindex`](/en-US/docs/Web/HTML/Reference/Global_attributes/tabindex).

> [!NOTE]
> Quy tắc đầu tiên của ARIA là nếu một phần tử hoặc thuộc tính HTML gốc có ngữ nghĩa và hành vi bạn cần, hãy dùng nó thay vì tái sử dụng một phần tử và thêm ARIA. Thay vào đó hãy dùng [HTML `<input type="radio">`](/en-US/docs/Web/HTML/Reference/Elements/input/radio) gốc (với một {{HTMLElement('label')}} liên kết), vốn tự cung cấp tất cả chức năng cần thiết:

```html
<fieldset>
  <legend>Ipsum and lorem?</legend>
  <div>
    <input type="radio" value="True" id="q25_radio1" name="q25" />
    <label for="q25_radio1">True</label>
  </div>
  <div>
    <input type="radio" value="False" id="q25_radio2" name="q25" />
    <label for="q25_radio2">False</label>
  </div>
  <div>
    <input type="radio" value="huh?" id="q25_radio3" name="q25" checked />
    <label for="q25_radio3">What is the question?</label>
  </div>
</fieldset>
```

Điều khiển form radio HTML gốc ([`<input type="radio">`](/en-US/docs/Web/HTML/Reference/Elements/input/radio)) có hai trạng thái ("được chọn" hoặc "không được chọn"). Tương tự, một phần tử có `role="radio"` có thể hiển thị hai trạng thái thông qua thuộc tính [`aria-checked`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-checked): `true` đại diện cho trạng thái được chọn, và `false` đại diện cho trạng thái chưa chọn. Giá trị `mixed` của `aria-checked` không hợp lệ để dùng cho radio button.

Nếu một radio button được chọn, phần tử radio có `aria-checked` được đặt thành `true`. Nếu không được chọn, nó có `aria-checked` được đặt thành `false`.

Mỗi phần tử radio button có vai trò `radio`. Vai trò radio luôn nên được lồng với các radio liên quan khác trong một `radiogroup`. Nếu không thể lồng radio button trong một radio group, hãy dùng `id` của radio không được lồng trong một danh sách giá trị cách nhau bằng dấu cách làm giá trị của thuộc tính [`aria-owns`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-owns) trên phần tử `radiogroup` để chỉ ra mối quan hệ của `radiogroup` với các thành viên radio của nó.

Mỗi phần tử radio được gắn nhãn bởi nội dung của nó, có một nhãn hiển thị được tham chiếu bởi `aria-labelledby`, hoặc có một nhãn được chỉ định bằng `aria-label`. Phần tử `radiogroup` chứa nên có một nhãn hiển thị được tham chiếu bởi `aria-labelledby` hoặc một nhãn được chỉ định bằng `aria-label`. Nếu có các phần tử cung cấp thêm thông tin về radio group hoặc từng radio button, những phần tử đó nên được tham chiếu bởi phần tử `radiogroup` hoặc các phần tử radio bằng thuộc tính [`aria-describedby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-describedby).

Vì `radio` là một điều khiển tương tác; nó phải có thể nhận focus và truy cập bằng bàn phím. Nếu vai trò này được áp dụng cho một phần tử không thể nhận focus, hãy dùng thuộc tính [`tabindex`](/en-US/docs/Web/HTML/Reference/Global_attributes/tabindex) để thay đổi điều đó. Phím tắt dự kiến để kích hoạt một radio là phím <kbd>Space</kbd>. Dùng JavaScript để chuyển thuộc tính `aria-checked` thành `true` khi một radio được chọn, đồng thời bảo đảm rằng tất cả các vai trò radio khác trong nhóm đều được đặt thành `aria-checked="false"`.

Để chỉ định theo chương trình rằng một radio button phải được chọn từ radio group, thuộc tính [`aria-required`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-required), với giá trị `true`, phải được đặt trên phần tử `radiogroup`. Không cần đặt thuộc tính `aria-required` trên từng radio button ARIA riêng lẻ.

### Tất cả phần tử con đều mang tính trình bày

Có một số loại thành phần giao diện người dùng, khi được biểu diễn trong một API khả năng tiếp cận của nền tảng, chỉ có thể chứa văn bản. Các API khả năng tiếp cận không có cách nào biểu diễn các phần tử ngữ nghĩa nằm trong `radio`. Để xử lý giới hạn này, trình duyệt tự động áp dụng vai trò [`presentation`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/presentation_role) cho mọi phần tử con của bất kỳ phần tử `radio` nào, vì đây là vai trò không hỗ trợ phần tử con mang ngữ nghĩa.

Ví dụ, hãy xem phần tử `radio` sau, có chứa một tiêu đề.

```html
<div role="radio"><h6>name of my radio</h6></div>
```

Vì các phần tử con của `radio` mang tính trình bày, nên đoạn mã sau tương đương:

```html
<div role="radio"><h6 role="presentation">name of my radio</h6></div>
```

Từ góc nhìn của người dùng công nghệ hỗ trợ, tiêu đề không tồn tại vì các đoạn mã trước đó tương đương với đoạn sau trong [cây khả năng tiếp cận](/en-US/docs/Glossary/Accessibility_tree):

```html
<div role="radio">name of my radio</div>
```

### Các vai trò, trạng thái và thuộc tính WAI-ARIA liên quan

- Vai trò [`radiogroup`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/radiogroup_role)
  - : Các radio button được chứa trong hoặc được sở hữu bởi một phần tử có vai trò `radiogroup`. Nếu không thể lồng trong `radiogroup` ngay trong markup, thuộc tính `aria-owns` của `radiogroup` chứa các giá trị `id` của các radio button không lồng trong nhóm.

- [`aria-checked`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-checked)
  - : Giá trị của `aria-checked` định nghĩa trạng thái của một radio. Khi dùng với phần tử radio, thuộc tính này có một trong hai giá trị:
    - `true`
      - : Radio được chọn.
    - `false`
      - : Radio không được chọn.

> [!NOTE]
> Dùng thuộc tính [`tabindex`](/en-US/docs/Web/HTML/Reference/Global_attributes/tabindex) nếu `role="radio"` được dùng trên một phần tử vốn không tự chấp nhận focus bàn phím. Ví dụ: `<div>` hoặc `<span>`.

### Tương tác bàn phím

- <kbd>Tab</kbd> + <kbd>Shift</kbd>
  - : Di chuyển focus vào và ra khỏi radio group. Khi focus đi vào một radio group, và một radio button đã được chọn, focus được đặt lên nút đã chọn. Nếu không radio button nào được chọn, focus được đặt lên radio button đầu tiên trong nhóm.

- <kbd>Space</kbd>
  - : Chọn radio nếu nó chưa được chọn. Bỏ chọn một radio button đã được chọn trước đó trong radio group.

- <kbd>Right Arrow</kbd> và <kbd>Down Arrow</kbd>
  - : Chuyển focus tới và chọn radio button tiếp theo trong nhóm, bỏ chọn radio button trước đó đang được focus. Nếu focus ở radio button cuối cùng, focus chuyển tới radio button đầu tiên.

- <kbd>Left Arrow</kbd> và <kbd>Up Arrow</kbd>
  - : Chuyển focus tới và chọn radio button trước đó trong nhóm, bỏ chọn radio button trước đó đang được focus. Nếu focus ở radio button đầu tiên, focus chuyển tới radio button cuối cùng.

### Radio trong toolbar

Vì phím mũi tên được dùng để điều hướng giữa các phần tử của toolbar và phím <kbd>Tab</kbd> di chuyển focus vào và ra khỏi toolbar, khi một radiogroup được lồng trong toolbar, tương tác bàn phím của radio group sẽ hơi khác so với radio group không nằm trong toolbar. Xem [`radiogroup` keyboard interactions](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/radiogroup_role#keyboard_interactions) để biết thêm thông tin

## JavaScript bắt buộc

- `onClick`
  - : Xử lý nhấp chuột trên cả radio và nhãn liên quan, thay đổi trạng thái radio bằng cách đổi giá trị thuộc tính `aria-checked` và đổi giao diện của radio để người dùng nhìn thấy nó như được đánh dấu hoặc không được đánh dấu
- `onKeyPress`
  - : Xử lý trường hợp người dùng nhấn phím <kbd>Space</kbd> để thay đổi trạng thái radio bằng cách đổi giá trị thuộc tính `aria-checked` và đổi giao diện của radio để người dùng nhìn thấy nó như được đánh dấu hoặc không được đánh dấu

## Ví dụ

Ví dụ sau dùng ARIA để sửa đổi các phần tử vốn dĩ chung chung để hiển thị như radio button. CSS và JavaScript được dùng để thay đổi trực quan và theo chương trình trạng thái được đánh dấu hoặc không được đánh dấu của phần tử.

### HTML

```html
<div role="radiogroup" aria-labelledby="legend" id="radiogroup">
  <p id="legend">
    Should you be using the <code>radio</code> role or
    <code>&lt;input type="radio"></code>?
  </p>
  <div>
    <span
      id="colorOption_0"
      tabindex="0"
      role="radio"
      aria-checked="true"
      aria-labelledby="purple"></span>
    <span id="purple">Purple</span>
  </div>
  <div>
    <span
      id="colorOption_1"
      tabindex="-1"
      role="radio"
      aria-checked="false"
      aria-labelledby="aubergine"></span>
    <span id="aubergine">Aubergine</span>
  </div>
  <div>
    <span
      id="colorOption_2"
      tabindex="-1"
      role="radio"
      aria-checked="false"
      aria-labelledby="magenta"></span>
    <span id="magenta">Magenta</span>
  </div>
  <div>
    <span
      id="colorOption_3"
      tabindex="-1"
      role="radio"
      aria-checked="false"
      aria-labelledby="all"></span>
    <span id="all">All of the above</span>
  </div>
</div>
```

### CSS

```css
[role="radio"] {
  padding: 5px;
}

[role="radio"][aria-checked="true"]::before {
  content: "(x)";
  font-family: monospace;
}

[role="radio"][aria-checked="false"]::before {
  content: "( )";
  font-family: monospace;
}
```

### JavaScript

Cần khá nhiều JavaScript để biến các phần tử HTML không ngữ nghĩa thành radio button.

```js
// initialize all the radio role elements

const radioGroups = document.querySelectorAll('[role="radiogroup"]');

for (const radioGroup of radioGroups) {
  const radios = radioGroup.querySelectorAll("[role=radio]");
  for (const radio of radios) {
    radio.addEventListener("keydown", handleKeydown);
    radio.addEventListener("click", handleClick);
  }
}

// handle mouse and touch events
function handleClick(event) {
  setChecked(this);
  event.stopPropagation();
  event.preventDefault();
}

// handle key presses
function handleKeydown(event) {
  switch (event.code) {
    case "Space":
    case "Enter":
      currentChecked();
      break;

    case "ArrowUp":
    case "ArrowLeft":
      previousRadioChecked();
      break;

    case "ArrowDown":
    case "ArrowRight":
      nextItemChecked();
      break;

    default:
      break;
  }
  event.stopPropagation();
  event.preventDefault();
}

// when a radio is selected, give it focus, set checked to true;
// ensure all other radios in radio group are not checked

function setChecked() {
  // uncheck all the radios in group
  // iterated through all the radios in radio group
  // eachRadio.tabIndex = -1;
  // eachRadio.setAttribute('aria-checked', 'false');
  // set the selected radio to checked
  // thisRadio.setAttribute('aria-checked', 'true');
  // thisRadio.tabIndex = 0;
  // thisRadio.focus();
  // set the value of the radioGroup to the value of the currently selected radio
}
```

## Đặc tả

{{Specifications}}

## Xem thêm

- [`menuitemcheckbox` role](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/menuitemcheckbox_role)
- [`menuitemradio` role](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/menuitemradio_role)
- [`menuitem` role](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/menuitem_role)
- [`option` role](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/option_role)
