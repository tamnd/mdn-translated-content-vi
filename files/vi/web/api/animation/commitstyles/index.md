---
title: "Animation: phương thức commitStyles()"
short-title: commitStyles()
slug: Web/API/Animation/commitStyles
page-type: web-api-instance-method
browser-compat: api.Animation.commitStyles
---

{{APIRef("Web Animations")}}

Phương thức `commitStyles()` của {{domxref("Animation")}} trong [Web Animations API](/en-US/docs/Web/API/Web_Animations_API) ghi các [giá trị được tính toán](/en-US/docs/Web/CSS/Guides/Cascade/Property_value_processing#computed_value) của kiểu hiện tại của hoạt ảnh vào thuộc tính [`style`](/en-US/docs/Web/HTML/Reference/Global_attributes/style) của phần tử đích.

Phương thức này chủ yếu được dùng để ghi kiểu của trạng thái cuối cùng của hoạt ảnh vào phần tử đích, để kiểu đó vẫn tồn tại sau khi hoạt ảnh kết thúc.

## Cú pháp

```js-nolint
commitStyles()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Mô tả

Phương thức `commitStyles()` chủ yếu được dùng để ghi các [giá trị được tính toán](/en-US/docs/Web/CSS/Guides/Cascade/Property_value_processing#computed_value) cho trạng thái cuối cùng của hoạt ảnh vào thuộc tính [`style`](/en-US/docs/Web/HTML/Reference/Global_attributes/style) của phần tử đích, để kiểu đó vẫn tồn tại sau khi hoạt ảnh kết thúc.
Việc này có thể được thực hiện khi hoạt ảnh đã hoàn tất (tức là thuộc tính {{domxref("Animation.finished","finished")}} của đối tượng {{domxref("Animation")}} đã được giải quyết).

### `commitStyles()` cùng với chế độ fill

Trên các trình duyệt cũ, bạn phải chỉ định [`fill` mode](/en-US/docs/Web/API/KeyframeEffect/KeyframeEffect#fill) để có thể commit kiểu vào phần tử _sau_ khi hoạt ảnh đã kết thúc.

Đoạn mã dưới đây cho thấy cách bạn có thể tạo hoạt ảnh cho một phần tử có tên `animatedElement`, đặt [`fill: "forwards"`](/en-US/docs/Web/API/KeyframeEffect/KeyframeEffect#fill) để giữ lại kiểu của hoạt ảnh sau khi nó kết thúc.
Khi hoạt ảnh kết thúc, chúng ta commit kiểu vào phần tử bằng `commitStyles()`.

```js
// Bắt đầu hoạt ảnh
const animation = animatedElement.animate(
  { transform: "translate(100px)" },
  { duration: 500, fill: "forwards" },
);

// Chờ cho hoạt ảnh kết thúc
await animation.finished;
// Ghi trạng thái hoạt ảnh vào thuộc tính style của animatedElement
animation.commitStyles();
// Hủy hoạt ảnh
animation.cancel();
```

Vì `fill` duy trì hoạt ảnh vô thời hạn, nên sau khi đã commit kiểu, chúng ta hủy hoạt ảnh.

Lưu ý rằng có thể đạt được hiệu ứng tương tự chỉ với `fill`, nhưng [việc dùng các hoạt ảnh duy trì vô thời hạn là không được khuyến khích](https://drafts.csswg.org/web-animations-1/#fill-behavior).
Hoạt ảnh [có ưu tiên cao hơn mọi kiểu tĩnh](/en-US/docs/Web/CSS/Guides/Cascade/Introduction#cascading_order), vì vậy một hoạt ảnh duy trì vô thời hạn có thể ngăn phần tử đích bao giờ được tạo kiểu theo cách bình thường.

> [!NOTE]
> Bạn cũng có thể tránh việc phải lưu rõ ràng trạng thái cuối cùng bằng cách đặt chúng làm kiểu ban đầu của phần tử rồi tạo hoạt ảnh về các kiểu cuối cùng.

### `commitStyles()` mà không đặt chế độ fill

Trên các trình duyệt mới hơn, bạn không cần đặt [`fill` mode](/en-US/docs/Web/API/KeyframeEffect/KeyframeEffect#fill) (xem [bảng tương thích trình duyệt](#browser_compatibility) để biết các phiên bản cụ thể).

> [!NOTE]
> Không có cách nào để kiểm tra tính năng cho hành vi mới này.
> Hiện tại, đa số mã vẫn nên tiếp tục đặt `fill` như trong phần trước.

Đoạn mã dưới đây cho thấy cách bạn có thể tạo hoạt ảnh cho một phần tử có tên `animatedElement`, chờ hoạt ảnh hoàn tất bằng thuộc tính {{domxref("Animation.finished","finished")}}, rồi commit kiểu vào phần tử bằng `commitStyles()`.
Vì chúng ta không đặt `fill`, nên sau đó không cần hủy hoạt ảnh.

```js
// Bắt đầu hoạt ảnh
const animation = animatedElement.animate(
  { transform: "translate(100px)" },
  { duration: 500 },
);

// Chờ cho hoạt ảnh kết thúc
await animation.finished;

// Ghi trạng thái hoạt ảnh vào thuộc tính style của animatedElement
animation.commitStyles();
```

`commitStyles()` vẫn hoạt động ngay cả khi hoạt ảnh đã bị [tự động gỡ bỏ](/en-US/docs/Web/API/Web_Animations_API/Using_the_Web_Animations_API#automatically_removing_filling_animations).
Sau khi kiểu của phần tử đã được commit, chúng có thể được sửa đổi và thay thế như bình thường.

## Ví dụ

### Hoạt ảnh có và không dùng fill

Ví dụ này minh họa cách bạn có thể dùng `commitStyles()` để lưu các kiểu được tính toán ở cuối hoạt ảnh, cả khi dùng lẫn không dùng `fill`.
Nó cũng cung cấp một ví dụ về điều gì xảy ra nếu không dùng `commitStyles()` hoặc `fill`, để so sánh.

Ví dụ trước hết hiển thị hai nút có nhãn "commitStyles() only" và "commitStyles() with fill".
Cả hai nút đều tạo hoạt ảnh khi bạn nhấp vào chúng, và cả hai đều gọi `commitStyles()` để duy trì trạng thái cuối cùng của hoạt ảnh.
Khác biệt là "commitStyles() only" không chỉ định `fill: "forwards"` để duy trì trạng thái cuối cùng của hoạt ảnh.
Trên các trình duyệt không khớp với đặc tả hiện tại, trạng thái cuối cùng có thể không được ghi lại.

Sau đó ví dụ hiển thị một nút "No commitStyles() or fill" để so sánh, và một nút "Reset".

#### HTML

```html
<button class="commit-styles">commitStyles() only</button>
<button class="commit-with-fill">commitStyles() with fill</button>
<button class="no-commit-or-fill">No commitStyles() or fill</button>
```

```html hidden
<button id="reset" type="button">Reset</button>
```

```css hidden
button {
  margin: 0.5rem;
  display: block;
}
```

```js hidden
const reload = document.querySelector("#reset");

reload.addEventListener("click", () => {
  window.location.reload(true);
});
```

#### JavaScript

Đoạn mã này định nghĩa một trình xử lý click cho nút "commitStyles() only".
Nó làm nút di chuyển sang phải hoặc trái khi được nhấp vào.
Lưu ý rằng `commitStyles()` được gọi ngay sau khi hoạt ảnh kết thúc.

```js
let offset1 = 0;

const commitStyles = document.querySelector(".commit-styles");

commitStyles.addEventListener("click", async (event) => {
  // Bắt đầu hoạt ảnh
  offset1 = 100 - offset1;
  const animation = commitStyles.animate(
    { transform: `translate(${offset1}px)` },
    { duration: 500 },
  );

  // Chờ cho hoạt ảnh kết thúc
  await animation.finished;
  // Ghi trạng thái hoạt ảnh vào thuộc tính style
  animation.commitStyles();
});
```

Đoạn mã này định nghĩa một trình xử lý click cho nút "commitStyles() with fill".
Nó cũng làm nút di chuyển sang phải hoặc trái khi được nhấp vào.
Vì nó đặt `fill` nên cần hủy hoạt ảnh sau đó.

Lưu ý rằng `commitStyles()` được gọi ngay sau khi hoạt ảnh kết thúc.

```js
const commitStylesWithFill = document.querySelector(".commit-with-fill");
let offset2 = 0;

commitStylesWithFill.addEventListener("click", async (event) => {
  // Bắt đầu hoạt ảnh
  offset2 = 100 - offset2;
  const animation = commitStylesWithFill.animate(
    { transform: `translate(${offset2}px)` },
    { duration: 500, fill: "forwards" },
  );

  // Chờ cho hoạt ảnh kết thúc
  await animation.finished;
  // Ghi trạng thái hoạt ảnh vào thuộc tính style
  animation.commitStyles();
  // Hủy hoạt ảnh
  animation.cancel();
});
```

Đoạn mã này định nghĩa một trình xử lý click cho nút "No commitStyles() or fill".
Nó cũng làm nút di chuyển sang phải hoặc trái khi được nhấp vào.
Nó không đặt `fill` và chúng ta không hủy hoạt ảnh.

```js
const noCommitStylesOrFill = document.querySelector(".no-commit-or-fill");
let offset3 = 0;

noCommitStylesOrFill.addEventListener("click", async (event) => {
  // Bắt đầu hoạt ảnh
  offset3 = 100 - offset3;
  const animation = noCommitStylesOrFill.animate(
    { transform: `translate(${offset3}px)` },
    { duration: 500 },
  );
});
```

#### Kết quả

Nhấp vào các nút để tạo hoạt ảnh cho chúng.
Lưu ý rằng nút đầu tiên sẽ "nhảy" ở cuối hoạt ảnh nếu trình duyệt hiện tại vẫn yêu cầu `fill` để kiểu được commit sau khi hoạt ảnh kết thúc.
Nút "No commitStyles() or fill" luôn nhảy ở cuối, vì trạng thái cuối cùng không được lưu lại.

{{EmbedLiveSample("Animation with and without using fill")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm
