---
title: "Document: startViewTransition() method"
short-title: startViewTransition()
slug: Web/API/Document/startViewTransition
page-type: web-api-instance-method
browser-compat: api.Document.startViewTransition
---

{{APIRef("View Transition API")}}

Phương thức **`startViewTransition()`** của giao diện {{domxref("Document")}} bắt đầu một [chuyển đổi khung nhìn](/en-US/docs/Web/API/View_Transition_API) cùng tài liệu mới (SPA) và trả về một đối tượng {{domxref("ViewTransition")}} để đại diện cho nó.

Khi `startViewTransition()` được gọi, một chuỗi các bước được thực hiện như giải thích trong [Quá trình chuyển đổi khung nhìn](/en-US/docs/Web/API/View_Transition_API/Using#the_view_transition_process).

## Cú pháp

```js-nolint
startViewTransition()
startViewTransition(updateCallback)
startViewTransition(options)
```

### Tham số

- `updateCallback` {{optional_inline}}
  - : Một callback tùy chọn thường được gọi để cập nhật DOM trong quá trình chuyển đổi khung nhìn SPA, trả về một {{jsxref("Promise")}}. Callback được gọi khi API đã chụp ảnh nhanh trang hiện tại. Khi promise do callback trả về được thỏa mãn, chuyển đổi khung nhìn bắt đầu trong khung hình tiếp theo. Nếu promise do callback trả về bị từ chối, quá trình chuyển đổi bị hủy bỏ.
- `options` {{optional_inline}}
  - : Một đối tượng chứa các tùy chọn để cấu hình chuyển đổi khung nhìn. Nó có thể bao gồm các thuộc tính sau:
    - `update` {{optional_inline}}
      - : Hàm `updateCallback` giống như mô tả ở trên. Mặc định là `null`.
    - `types` {{optional_inline}}
      - : Một mảng các chuỗi đại diện cho các loại được áp dụng cho chuyển đổi khung nhìn. [Các loại chuyển đổi khung nhìn](/en-US/docs/Web/API/View_Transition_API/Using_types) cho phép áp dụng có chọn lọc các kiểu CSS hoặc logic JavaScript dựa trên loại chuyển đổi đang xảy ra. Mặc định là một chuỗi rỗng.

### Giá trị trả về

Một đối tượng {{domxref("ViewTransition")}}.

## Ví dụ

Xem [View transition API > Ví dụ](/en-US/docs/Web/API/View_Transition_API#examples) để biết danh sách các ví dụ đầy đủ.

### Sử dụng cơ bản

Trong chuyển đổi khung nhìn cùng tài liệu này, chúng ta kiểm tra xem trình duyệt có hỗ trợ chuyển đổi khung nhìn không.
Nếu không hỗ trợ, chúng ta đặt màu nền bằng phương pháp dự phòng được áp dụng ngay lập tức.
Ngược lại, chúng ta có thể gọi `document.startViewTransition()` một cách an toàn với các quy tắc animation mà chúng ta định nghĩa trong CSS.

```html
<main>
  <section></section>
  <button id="change-color">Change color</button>
</main>
```

Chúng ta đang đặt `animation-duration` là 2 giây bằng cách sử dụng phần tử giả {{CSSXRef("::view-transition-group")}}.

```css
html {
  --bg: indigo;
}
main {
  display: flex;
  flex-direction: column;
  gap: 5px;
}
section {
  background-color: var(--bg);
  height: 60px;
  border-radius: 5px;
}
::view-transition-group(root) {
  animation-duration: 2s;
}
```

```js
const colors = ["darkred", "darkslateblue", "darkgreen"];
const colBlock = document.querySelector("section");
let count = 0;
const updateColor = () => {
  colBlock.style = `--bg: ${colors[count]}`;
  count = count !== colors.length - 1 ? ++count : 0;
};
const changeColor = () => {
  // Dự phòng cho trình duyệt không hỗ trợ View Transitions:
  if (!document.startViewTransition) {
    updateColor();
    return;
  }

  // Với View Transitions:
  const transition = document.startViewTransition(() => {
    updateColor();
  });
};
const changeColorButton = document.querySelector("#change-color");
changeColorButton.addEventListener("click", changeColor);
changeColorButton.addEventListener("keypress", changeColor);
```

Nếu chuyển đổi khung nhìn được hỗ trợ, nhấp vào nút sẽ chuyển đổi màu từ màu này sang màu khác trong 2 giây.
Ngược lại, màu nền được đặt bằng phương pháp dự phòng, không có animation.

{{EmbedLiveSample('color_change', '100%', '120')}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Document.activeViewTransition")}}
- Lớp giả {{CSSXRef(":active-view-transition")}}
- Lớp giả {{cssxref(":active-view-transition-type", ":active-view-transition-type()")}}
- [View Transition API](/en-US/docs/Web/API/View_Transition_API)
- [Sử dụng View Transition API](/en-US/docs/Web/API/View_Transition_API/Using)
- [Sử dụng các loại chuyển đổi khung nhìn](/en-US/docs/Web/API/View_Transition_API/Using_types)
- [Smooth transitions with the View Transition API](https://developer.chrome.com/docs/web-platform/view-transitions/)
