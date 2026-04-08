---
title: Keyframe selectors
slug: Web/CSS/Reference/Selectors/Keyframe_selectors
page-type: css-selector
browser-compat: css.selectors.keyframe
sidebar: cssref
---

**Bộ chọn khung hình chính** (keyframe selectors) CSS xác định các điểm cụ thể trên dòng thời gian hoạt ảnh nơi các kiểu khung hình chính nên được áp dụng. Các bộ chọn này chỉ được dùng trong quy tắc at {{cssxref("@keyframes")}}.

## Cú pháp

```css
/* Keywords */
from {
}
to {
}

/* <percentage> values */
0% {
}
50% {
}
100% {
}

/* With <timeline-range-name> */
entry 20% {
}
exit 80% {
}

/* Selector lists */
0%,
50%,
100% {
}
from,
to {
}
```

### Giá trị

- `from`
  - : Đại diện cho điểm bắt đầu của chuỗi hoạt ảnh. Tương đương với `0%`.
- `to`
  - : Đại diện cho điểm kết thúc của chuỗi hoạt ảnh. Tương đương với `100%`.
- `<percentage>`
  - : Một {{cssxref("percentage")}} từ `0%` đến `100%`, bao gồm, đại diện cho tiến trình tổng thể qua chuỗi hoạt ảnh.
- `<timeline-range-name> <percentage>`
  - : Một {{cssxref("timeline-range-name")}} đứng trước thành phần `<percentage>` đại diện cho một điểm tiến trình cụ thể trong phạm vi dòng thời gian được đặt tên.

## Mô tả

Một `<keyframe-selector>` có thể là từ khóa `to` hoặc `from`, một phần trăm từ `0%` đến `100%` bao gồm, hoặc danh sách phân tách bằng dấu phẩy của các từ khóa và/hoặc phần trăm này. Khi phần trăm đứng trước bởi một {{cssxref("timeline-range-name")}}, nó định nghĩa một phạm vi dòng thời gian nếu dòng thời gian hoạt ảnh là dòng thời gian tiến trình khung nhìn; nếu không, bộ chọn sẽ bị bỏ qua. Khi danh sách `<keyframe-selector>` phân tách bằng dấu phẩy được sử dụng, khối kiểu theo sau áp dụng cho tất cả các điểm tiến trình được chỉ định.

### Giá trị phần trăm hợp lệ

Giá trị phần trăm phải bao gồm dấu phần trăm (`%`). Các giá trị không có đơn vị (như `0` và `20`) và các giá trị ngoài phạm vi `0%` đến `100%` (như `-10%` hoặc `110%`) không hợp lệ và sẽ khiến khối khung hình chính bị bỏ qua.

### Tầng, thứ tự, ưu tiên và tầm quan trọng

Các giá trị thuộc tính được đặt bởi `@keyframes` hoạt ảnh quan trọng hơn tất cả các kiểu thông thường, nghĩa là bất kể [độ ưu tiên](/en-US/docs/Web/CSS/Guides/Cascade/Specificity), một giá trị được tạo hoạt ảnh sẽ ghi đè các giá trị không có cờ {{cssxref("important", "!important")}}. Chỉ các giá trị thuộc tính quan trọng và các giá trị đang được chuyển tiếp mới có ưu tiên hơn các giá trị thuộc tính được hoạt ảnh.

Tất cả các bộ chọn khung hình chính có cùng độ ưu tiên. Thứ tự của bộ chọn khung hình chính trong danh sách bộ chọn không quan trọng. Thứ tự nguồn chỉ quan trọng nếu bộ chọn khung hình chính trùng lặp khai báo một giá trị khác cho một thuộc tính đã được khai báo trên cùng bộ chọn.

Cờ `!important` không hợp lệ trong định nghĩa `@keyframes`.

### Bộ chọn bắt đầu và kết thúc bị bỏ qua

Nếu không có khung hình chính `0%` (hoặc `from`) hoặc `100%` (hoặc `to`) được chỉ định, trình duyệt sẽ sử dụng các kiểu đã tính toán của phần tử cho những trạng thái đó, cho phép hoạt ảnh chuyển đổi mượt mà từ hoặc đến các giá trị thuộc tính không được hoạt ảnh của phần tử. Nói cách khác, nếu một thuộc tính được chỉ định trong một khung hình chính ở giữa dòng thời gian mà không được đặt trong khối bộ chọn khung hình chính bắt đầu hoặc kết thúc, thuộc tính đó sẽ được hoạt ảnh từ giá trị ban đầu đến giá trị đó.

Ví dụ, nếu một phần tử có màu nền `red`, và hoạt ảnh sau được áp dụng:

```css
@keyframes changeToPurple {
  25%,
  75% {
    background-color: purple;
  }
}
```

Màu nền sẽ là `red` ở đầu hoạt ảnh, chuyển sang `purple` sau một phần tư hoạt ảnh, duy trì `purple` trong nửa hoạt ảnh, và chuyển trở lại `red`, màu nền ban đầu, bắt đầu từ `75%` trên [dòng thời gian hoạt ảnh](/en-US/docs/Web/CSS/Reference/Properties/animation-timeline). Xem ví dụ [bỏ qua `to` và `from`](#omitting_to_and_from).

#### Khai báo thuộc tính bị bỏ qua

Khi tạo hoạt ảnh `@keyframes` để tạo hoạt ảnh cho nhiều thuộc tính, bạn không cần phải khai báo tất cả các thuộc tính trong tất cả các khối bộ chọn khung hình chính.

Ví dụ, trong ví dụ [sử dụng cơ bản](#basic_usage), `opacity` được khai báo trong tất cả các khối bộ chọn khung hình chính, nhưng chỉ các giá trị `transform` bắt đầu và kết thúc được đặt. Trong trường hợp đó, phần tử sẽ hoàn toàn mờ đục ở `50%` qua dòng thời gian hoạt ảnh, nhưng điểm mà phần tử được biến đổi `25vw` sang phải phụ thuộc vào {{cssxref("animation-timing-function")}} — sẽ là `50%` trong trường hợp `linear`, nhưng không phải nếu `ease-in` được dùng (đây là trường hợp trong ví dụ này).

### Thứ tự tầng

Nếu nhiều khối khung hình chính sử dụng cùng `<keyframe-selector>`, chúng [tầng](/en-US/docs/Web/CSS/Guides/Cascade/Introduction) với nhau. Điều này có nghĩa là nếu cùng một thuộc tính được định nghĩa trong nhiều khối với cùng bộ chọn, khai báo cuối cùng trong quy tắc sẽ được ưu tiên. Nếu chúng định nghĩa các thuộc tính khác nhau, chúng được hợp nhất.

Hoạt ảnh này lặp lại các giá trị không thay đổi trong nhiều khối bộ chọn, điều này không cần thiết:

```css
@keyframes uglyAnimation {
  0% {
    transform: translateX(0);
    opacity: 0;
    background-color: purple;
  }
  50% {
    transform: translateX(0);
    opacity: 1;
    background-color: purple;
  }
  75% {
    transform: translateX(0);
    opacity: 0;
    background-color: green;
  }
  100% {
    transform: translateX(50vw);
    opacity: 0;
    background-color: purple;
  }
}
```

Chúng ta có thể dùng tầng để nhóm các giá trị trong một khối bộ chọn, rồi ghi đè khi cần. Sau đây tương đương với hoạt ảnh trước, nhưng với ít dòng CSS hơn:

```css
@keyframes uglyAnimation {
  0%,
  50%,
  75%,
  100% {
    transform: translateX(0);
    opacity: 0;
    background-color: purple;
  }
  50% {
    opacity: 1;
  }
  75% {
    background-color: green;
  }
  100% {
    transform: translateX(50vw);
  }
}
```

Thứ tự rất quan trọng! Chúng ta không thể bỏ qua tầng. Nếu sắp xếp lại ở trên không đúng, chúng ta mất các chuyển tiếp. Ví dụ sau làm cho phần tử màu tím, hoàn toàn mờ đục, và đặt lại tất cả các biến đổi trong suốt thời gian hoạt ảnh được áp dụng. Các giá trị thuộc tính được áp dụng và duy trì tĩnh vì khai báo cuối cùng ghi đè các khai báo trong các khối bộ chọn khung hình chính trước đó.

```css
@keyframes makeItPurpleOnly {
  0% {
    background-color: yellow;
  }
  50% {
    opacity: 0;
  }
  75% {
    background-color: green;
  }
  100% {
    transform: translateX(50vw);
  }
  0%,
  50%,
  75%,
  100% {
    transform: translateX(0);
    opacity: 1;
    background-color: purple;
  }
}
```

### Với phạm vi dòng thời gian được đặt tên

Ban đầu được định nghĩa trong [mô-đun hoạt ảnh CSS](/en-US/docs/Web/CSS/Guides/Animations), [mô-đun hoạt ảnh cuộn CSS](/en-US/docs/Web/CSS/Guides/Scroll-driven_animations) đã mở rộng bộ chọn khung hình chính để cho phép thông tin phạm vi dòng thời gian tiến trình khung nhìn được đưa trực tiếp vào định nghĩa hoạt ảnh `@keyframes`. Một {{cssxref("timeline-range-name")}} có thể đứng trước thành phần `<percentage>` của bộ chọn để gắn khung hình chính vào các điểm tiến trình cụ thể trong phạm vi dòng thời gian được đặt tên. `<timeline-range-name>` đại diện cho phạm vi dòng thời gian được đặt tên được chọn trước, và `<percentage>` theo sau đại diện cho phần trăm tiến trình giữa đầu và cuối của phạm vi dòng thời gian được đặt tên đó.

```css
@keyframes in-and-out {
  entry 0% {
    opacity: 0;
    transform: translateX(100%);
  }
  entry 100% {
    opacity: 1;
    transform: translateX(0);
  }
  exit 0% {
    opacity: 1;
    transform: translateX(0);
  }
  exit 100% {
    opacity: 0;
    transform: translateX(-100%);
  }
}
```

Nếu dòng thời gian hoạt ảnh của phần tử không có phạm vi dòng thời gian khung nhìn được đặt tên tương ứng, thì bất kỳ khung hình chính nào được gắn vào các điểm trên phạm vi dòng thời gian được đặt tên đó sẽ bị bỏ qua. Những điểm gắn này có thể nằm ngoài khoảng hoạt động của hoạt ảnh. Khi điều này xảy ra, các khung hình chính `from` (`0%`) và `to` (`100%`) tự động chỉ được tạo ra cho các thuộc tính không có khung hình chính tại hoặc trước `0%` hoặc tại hoặc sau `100%`, tương ứng. Xem [hướng dẫn tên phạm vi dòng thời gian](/en-US/docs/Web/CSS/Guides/Scroll-driven_animations/Timeline_range_names) để biết thêm thông tin.

## Ví dụ

### Sử dụng cơ bản

Ví dụ này minh họa việc sử dụng từ khóa và phần trăm bằng cách tạo hoạt ảnh khung hình chính sử dụng các loại bộ chọn khung hình chính này.

#### HTML

Chúng ta bao gồm một phần tử mà chúng ta sẽ tạo hoạt ảnh.

```html
<div>I am animated</div>
```

#### CSS

Chúng ta cung cấp một số kiểu cơ bản cho hộp của mình:

```css
div {
  background-color: rebeccapurple;
  color: white;
  width: min-content;
  padding: 10px;
  font: 2rem sans-serif;
}
```

Chúng ta tạo hoạt ảnh {{cssxref("@keyframes")}}, áp dụng kiểu cho các từ khóa `from` và `to` và một phần trăm giữa. Chúng ta tạo hoạt ảnh cho các thuộc tính {{cssxref("opacity")}} và {{cssxref("transform")}}.

```css
@keyframes slide-and-fade {
  from {
    transform: translateX(0);
    opacity: 0;
  }
  50% {
    opacity: 1;
  }
  to {
    transform: translateX(50vw);
    opacity: 0;
  }
}
```

Chúng ta áp dụng hoạt ảnh cho phần tử bằng thuộc tính viết tắt {{cssxref("animation")}}:

```css
div {
  animation: slide-and-fade 4s ease-in infinite;
}
```

#### Kết quả

{{EmbedLiveSample("Basic usage","100%","200")}}

### Danh sách bộ chọn

Sử dụng cùng HTML và kiểu cơ bản như ví dụ trước, ví dụ này minh họa việc sử dụng bộ chọn phân tách bằng dấu phẩy để nhóm các khung hình chính, áp dụng cùng kiểu tại nhiều điểm trong hoạt ảnh.

```html hidden
<div>I am animated</div>
```

#### CSS

Chúng ta tạo hoạt ảnh `pulse` thay đổi kích thước của phần tử.

```css
div {
  animation: pulse 4s linear infinite;
}

@keyframes pulse {
  0%,
  75% {
    transform: scale(1);
  }
  50% {
    transform: scale(1.2);
  }
  25%,
  100% {
    transform: scale(0.8);
  }
}
```

```css hidden
div {
  background-color: rebeccapurple;
  color: white;
  width: min-content;
  padding: 10px;
  font: 2rem sans-serif;
}
```

#### Kết quả

{{EmbedLiveSample("Selector lists and initial values","100%","125")}}

Bằng cách sử dụng danh sách bộ chọn với nhiều bộ chọn khung hình chính phân tách bằng dấu phẩy, hoạt ảnh "tạm dừng" từ khung hình chính `25%` cho đến khi đạt khung hình chính `75%`.

### Bỏ qua `to` và `from`

Ví dụ này minh họa cách, khi các bộ chọn khung hình chính `to` hoặc `from` không được đưa vào định nghĩa hoạt ảnh `@keyframes`, các thuộc tính được hoạt ảnh sẽ tạo hoạt ảnh đến và từ các giá trị thuộc tính ban đầu, không được hoạt ảnh.

#### HTML

Chúng ta bao gồm một vài phần tử. Chúng ta sẽ tạo hoạt ảnh cho tất cả chúng.

```html
<div>I am animated</div>
<div>I am animated</div>
<div>I am animated</div>
```

#### CSS

Chúng ta cung cấp kiểu cơ bản cho các phần tử, và cho mỗi phần tử một {{cssxref("outline-width")}} và {{cssxref("background-color")}} khác nhau. Chúng ta sẽ tạo hoạt ảnh cho hai thuộc tính này.

```css
div {
  background-color: magenta;
  outline: 10px dashed black;
  color: white;
  width: min-content;
  padding: 10px;
  font: 2rem sans-serif;
  margin: 35px auto;

  animation: changes 5s linear infinite;
}
div:first-of-type {
  background-color: blue;
  outline-width: 0;
}
div:last-of-type {
  background-color: green;
  outline-width: 20px;
}
```

Chúng ta tạo hoạt ảnh đặt `background-color` và `outline-width` của phần tử tại các khung hình chính `30%` và `40%`.

```css
@keyframes changes {
  30%, 40% {
    background-color: black;
    outline-width: 15px;
}
```

#### Kết quả

{{EmbedLiveSample("Omitting to and from","100%","420")}}

Các thuộc tính `background-color` và `outline-width` được đặt trong các khung hình chính `30%` và `40%`. Kết quả là, các giá trị `background-color` của phần tử được hoạt ảnh từ `green`, `magenta`, và `blue` đến `black` trong khi các giá trị `outline-width` được hoạt ảnh từ `0px`, `10px`, và `20px` đến `15px`. Chúng duy trì trạng thái đó trong một phần mười hoạt ảnh — giữa `30%` và `40%` thời gian. Sau `40%` thời gian, các thuộc tính này được hoạt ảnh trở lại giá trị ban đầu.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("@keyframes")}}
- {{cssxref("animation")}}
- {{cssxref("animation-range")}}
- [Tìm hiểu tên phạm vi dòng thời gian](/en-US/docs/Web/CSS/Guides/Scroll-driven_animations/Timeline_range_names)
- [Sử dụng hoạt ảnh CSS](/en-US/docs/Web/CSS/Guides/Animations/Using)
- Mô-đun [hoạt ảnh CSS](/en-US/docs/Web/CSS/Guides/Animations)
- [Hoạt ảnh cuộn CSS](/en-US/docs/Web/CSS/Guides/Scroll-driven_animations)
