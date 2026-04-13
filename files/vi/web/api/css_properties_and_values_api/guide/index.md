---
title: Sử dụng CSS properties and values API
slug: Web/API/CSS_Properties_and_Values_API/guide
page-type: guide
browser-compat: api.CSS.registerProperty_static
---

{{DefaultAPISidebar("CSS Properties and Values API")}}

**CSS Properties and Values API**, là một phần của nhóm API [CSS Houdini](/en-US/docs/Web/API/Houdini_APIs), cho phép đăng ký [thuộc tính tùy chỉnh CSS](/en-US/docs/Web/CSS/Reference/Properties/--*), hỗ trợ kiểm tra kiểu thuộc tính, giá trị mặc định và các thuộc tính có hoặc không kế thừa giá trị.

## Đăng ký một thuộc tính tùy chỉnh

Đăng ký một thuộc tính tùy chỉnh cho phép bạn thông báo cho trình duyệt biết cách thuộc tính tùy chỉnh nên hoạt động: kiểu nào được phép, liệu thuộc tính tùy chỉnh có kế thừa giá trị hay không và giá trị mặc định của thuộc tính tùy chỉnh là gì. Có hai cách để đăng ký một thuộc tính, trong [JavaScript](/en-US/docs/Web/JavaScript) hoặc trong [CSS](/en-US/docs/Web/CSS).

### CSS.registerProperty

Ví dụ dưới đây sẽ đăng ký một [thuộc tính tùy chỉnh](/en-US/docs/Web/CSS/Reference/Properties/--*) có tên `--my-prop` sử dụng {{domxref('CSS/registerProperty_static', 'CSS.registerProperty')}}. `--my-prop` sẽ sử dụng cú pháp màu CSS, có giá trị mặc định là `#c0ffee` và sẽ không kế thừa giá trị:

```js
window.CSS.registerProperty({
  name: "--my-prop",
  syntax: "<color>",
  inherits: false,
  initialValue: "#c0ffee",
});
```

### @property

Việc đăng ký tương tự có thể diễn ra trong CSS. Ví dụ dưới đây sẽ đăng ký một [thuộc tính tùy chỉnh](/en-US/docs/Web/CSS/Reference/Properties/--*) có tên `--my-prop` sử dụng at-rule {{cssxref('@property')}} [at-rule](/en-US/docs/Web/CSS/Guides/Syntax/At-rules). `--my-prop` sẽ sử dụng cú pháp màu CSS, có giá trị mặc định là `#c0ffee` và sẽ không kế thừa giá trị:

```css
@property --my-prop {
  syntax: "<color>";
  inherits: false;
  initial-value: #c0ffee;
}
```

## Sử dụng các thuộc tính tùy chỉnh đã đăng ký

Một trong những lợi ích của việc đăng ký một thuộc tính là trình duyệt bây giờ biết cách xử lý thuộc tính tùy chỉnh của bạn thông qua các thứ như transitions! Khi một thuộc tính chưa được đăng ký, trình duyệt không biết cách xử lý nó, vì vậy nó giả sử rằng bất kỳ giá trị nào cũng có thể được sử dụng và do đó không thể tạo hiệu ứng. Nhưng khi một thuộc tính có một cú pháp đã đăng ký, trình duyệt có thể tối ưu hóa xung quanh cú pháp đó, bao gồm cả khả năng tạo hiệu ứng cho nó!

Trong ví dụ này, thuộc tính tùy chỉnh `--registered` đã được đăng ký sử dụng cú pháp `<color>` và sau đó được sử dụng trong một linear gradient. Thuộc tính đó sau đó được chuyển đổi khi di chuột hoặc focus sang một màu khác. Lưu ý rằng transition hoạt động với thuộc tính đã đăng ký nhưng không hoạt động với thuộc tính chưa đăng ký!

### HTML

```html
<button class="registered">Background Registered</button>
<button class="unregistered">Background Not Registered</button>
```

### CSS

```css
.registered {
  --registered: #c0ffee;
  background-image: linear-gradient(to right, white, var(--registered));
  transition: --registered 1s ease-in-out;
}

.registered:hover,
.registered:focus {
  --registered: #b4d455;
}

.unregistered {
  --unregistered: #c0ffee;
  background-image: linear-gradient(to right, white, var(--unregistered));
  transition: --unregistered 1s ease-in-out;
}

.unregistered:hover,
.unregistered:focus {
  --unregistered: #b4d455;
}

button {
  height: 40vh;
  display: block;
  width: 100%;
  font-size: 3vw;
}
```

### JavaScript

```js
window.CSS.registerProperty({
  name: "--registered",
  syntax: "<color>",
  inherits: false,
  initialValue: "red",
});
```

### Kết quả

{{EmbedLiveSample("Using_registered_custom_properties", 320, 320)}}

## Những điểm cần lưu ý

Có hai điểm cần lưu ý khi đăng ký một thuộc tính. Đầu tiên là một khi thuộc tính đã được đăng ký, không có cách nào để cập nhật nó, và việc cố gắng đăng ký lại nó bằng [JavaScript](/en-US/docs/Web/JavaScript) sẽ báo lỗi cho biết nó đã được định nghĩa.

Thứ hai, không giống như các thuộc tính tiêu chuẩn, các thuộc tính đã đăng ký không được kiểm tra khi phân tích. Thay vào đó, chúng được kiểm tra khi tính toán. Điều đó có nghĩa là cả hai trường hợp: các giá trị không hợp lệ sẽ không xuất hiện là không hợp lệ khi kiểm tra các thuộc tính của phần tử, và việc thêm một thuộc tính không hợp lệ sau một thuộc tính hợp lệ sẽ không quay trở lại thuộc tính hợp lệ. Tuy nhiên, một thuộc tính không hợp lệ sẽ quay trở lại giá trị mặc định đã đăng ký của nó.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Registering custom properties with CSS](/en-US/docs/Web/CSS/Guides/Properties_and_values_API/Registering_properties)
