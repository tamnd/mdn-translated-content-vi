---
title: HTML hidden global attribute
short-title: hidden
slug: Web/HTML/Reference/Global_attributes/hidden
page-type: html-attribute
browser-compat: html.global_attributes.hidden
sidebar: htmlsidebar
---

Thuộc tính [toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes) **`hidden`** là thuộc tính {{Glossary("enumerated")}} cho biết trình duyệt không nên hiển thị nội dung của phần tử. Ví dụ, nó có thể được dùng để ẩn các phần tử trên trang mà không thể sử dụng cho đến khi quá trình đăng nhập hoàn tất.

{{InteractiveExample("HTML Demo: hidden", "tabbed-shorter")}}

```html interactive-example
<p>
  This content should be read right now, as it is important. I am so glad you
  are able to find it!
</p>

<p hidden>
  This content is not relevant to this page right now, so should not be seen.
  Nothing to see here. Nada.
</p>
```

```css interactive-example
p {
  background: #ffe8d4;
  border: 1px solid #f69d3c;
  padding: 5px;
  border-radius: 5px;
}
```

## Mô tả

Thuộc tính `hidden` cho biết rằng nội dung của phần tử không nên được trình bày cho người dùng.
Thuộc tính nhận một trong các giá trị sau:

- từ khóa `hidden`
- từ khóa `until-found`
- một chuỗi rỗng hoặc không có giá trị

Các giá trị thuộc tính `hidden` không hợp lệ cũng đặt phần tử vào trạng thái _ẩn_. Do đó, tất cả các phần tử sau đây đều ở trạng thái [_ẩn_](#the_hidden_state):

```html
<span hidden>I'm hidden</span>
<span hidden="">I'm also hidden</span>
<span hidden="hidden">I'm hidden too!</span>
<span hidden="bananas">I'm equally as hidden!</span>
```

Từ khóa `until-found` đặt phần tử vào trạng thái [_ẩn cho đến khi tìm thấy_](#the_hidden_until_found_state):

```html
<span hidden="until-found">I'm hidden until found</span>
```

### Trạng thái ẩn

Trạng thái _ẩn_ cho biết rằng phần tử hiện không liên quan đến trang, hoặc nó được dùng để khai báo nội dung để tái sử dụng bởi các phần khác của trang và không nên được trình bày trực tiếp cho người dùng. Trình duyệt sẽ không hiển thị các phần tử ở trạng thái _ẩn_.

Trình duyệt web có thể thực hiện trạng thái _ẩn_ bằng cách sử dụng `display: none`, trong trường hợp đó phần tử sẽ không tham gia vào bố cục trang.
Ngoài ra, việc thay đổi giá trị của thuộc tính CSS {{cssxref("display")}} trên một phần tử ẩn sẽ ghi đè trạng thái _ẩn_.
Ví dụ, các phần tử được tạo kiểu `display: block` sẽ được hiển thị mặc dù có thuộc tính `hidden`.

### Trạng thái ẩn cho đến khi tìm thấy

Trong trạng thái _ẩn cho đến khi tìm thấy_, phần tử bị ẩn nhưng nội dung của nó sẽ có thể truy cập được thông qua tính năng "Tìm trong trang" của trình duyệt hoặc qua điều hướng phân đoạn.
Khi các tính năng này khiến trình duyệt cuộn đến một phần tử trong cây con _ẩn cho đến khi tìm thấy_, trình duyệt sẽ:

1. Kích hoạt sự kiện [`beforematch`](/en-US/docs/Web/API/Element/beforematch_event) trên phần tử ẩn
2. Xóa thuộc tính `hidden` khỏi phần tử
3. Cuộn đến phần tử

Điều này cho phép bạn thu gọn một phần nội dung trong khi vẫn cho phép người dùng tìm thấy nó qua tìm kiếm hoặc điều hướng.

Các trình duyệt thường triển khai _ẩn cho đến khi tìm thấy_ bằng cách sử dụng {{cssxref("content-visibility", "content-visibility: hidden")}}.
Điều này có nghĩa là, không giống như các phần tử ở trạng thái _ẩn_, các phần tử ở trạng thái _ẩn cho đến khi tìm thấy_ tạo ra các hộp, và:

- chúng tham gia vào bố cục trang
- margin, border, padding, và background của chúng được hiển thị

Ngoài ra, phần tử cần được ảnh hưởng bởi [layout containment](/en-US/docs/Web/CSS/Guides/Containment) để có thể được tiết lộ.
Nếu phần tử ở trạng thái _ẩn cho đến khi tìm thấy_ có giá trị `display` là `none`, `contents`, hoặc `inline`, thì phần tử sẽ không được tiết lộ bởi "Tìm trong trang" hoặc điều hướng phân đoạn.

## Ghi chú sử dụng

Thuộc tính `hidden` không được sử dụng chỉ để ẩn nội dung khỏi một cách trình bày.
Nếu thứ gì đó được đánh dấu là ẩn, nó bị ẩn khỏi tất cả các cách trình bày, bao gồm cả các trình đọc màn hình.

Các phần tử ẩn không nên được liên kết từ các phần tử hiển thị trừ khi sử dụng `hidden="until-found"`.
Ví dụ, sẽ là không đúng khi sử dụng thuộc tính `href` để liên kết đến một phần có thuộc tính `hidden`.
Nếu nội dung không áp dụng hoặc không liên quan, nó không nên được liên kết.

Tuy nhiên, bạn có thể sử dụng thuộc tính ARIA [`aria-describedby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-describedby) để tham chiếu đến các mô tả ẩn. Mặc dù việc ẩn các mô tả ngụ ý rằng chúng không hữu ích khi đứng một mình, chúng có thể cung cấp ngữ cảnh hữu ích khi được tham chiếu theo cách này.

Tương tự, một phần tử canvas có thuộc tính `hidden` có thể được sử dụng bởi công cụ đồ họa có kịch bản như bộ đệm ngoài màn hình, và một điều khiển biểu mẫu có thể tham chiếu đến một phần tử biểu mẫu ẩn bằng cách sử dụng thuộc tính form.

Cuối cùng, lưu ý rằng các phần tử con của phần tử ẩn vẫn hoạt động, nghĩa là các phần tử script vẫn có thể thực thi, và các phần tử biểu mẫu vẫn có thể gửi:

```html
<div hidden>
  <script>
    console.warn("Boo! I'm hidden *and* running!");
  </script>
</div>
```

## Ví dụ

### Sử dụng thuộc tính hidden

Trong ví dụ này, chúng ta có ba phần tử {{HTMLElement("div")}}. Phần tử đầu tiên và phần tử thứ ba không bị ẩn, trong khi phần tử thứ hai có thuộc tính `hidden`.
Lưu ý rằng phần tử ẩn không có hộp được tạo ra.

```html
<div>I'm not hidden</div>
<div hidden>I'm hiding!</div>
<div>I'm not hidden, either</div>
```

```css hidden
div {
  height: 40px;
  width: 300px;
  border: 5px dashed black;
  margin: 1rem 0;
  padding: 1rem;
  font-size: 2rem;
}
```

{{EmbedLiveSample("using_the_hidden_attribute", "", 300)}}

### Sử dụng giá trị until-found

Trong ví dụ này, chúng ta có ba phần tử {{HTMLElement("div")}}.
Phần tử đầu tiên và phần tử thứ ba hiển thị, trong khi phần tử thứ hai có các thuộc tính `hidden="until-found"` và `id="until-found-box"`.
Phần tử có id `until-found-box` có viền đỏ chấm và nền màu xám.

Chúng ta cũng có một liên kết trỏ đến phân đoạn `"until-found-box"` và JavaScript lắng nghe sự kiện `beforematch` kích hoạt trên phần tử ẩn đó.
Trình xử lý sự kiện thay đổi nội dung văn bản của hộp để minh họa một hành động có thể xảy ra khi trạng thái _ẩn cho đến khi tìm thấy_ sắp bị xóa.

#### HTML

```html
<a href="#until-found-box">Go to hidden content</a>

<div>I'm not hidden</div>
<div id="until-found-box" hidden="until-found">Hidden until found</div>
<div>I'm not hidden, either</div>
```

```html hidden
<button id="reset">Reset</button>
```

#### CSS

```css
div {
  height: 40px;
  width: 300px;
  border: 5px dashed black;
  margin: 1rem 0;
  padding: 1rem;
  font-size: 2rem;
}

div#until-found-box {
  color: red;
  border: 5px dotted red;
  background-color: lightgray;
}
```

```css hidden
#until-found-box {
  scroll-margin-top: 200px;
}
```

#### JavaScript

```js
const untilFound = document.querySelector("#until-found-box");
untilFound.addEventListener(
  "beforematch",
  () => (untilFound.textContent = "I've been revealed!"),
);
```

```js hidden
document.querySelector("#reset").addEventListener("click", () => {
  document.location.hash = "";
  document.location.reload();
});
```

#### Kết quả

Nhấp vào liên kết "Go to hidden content" sẽ điều hướng đến phần tử _ẩn cho đến khi tìm thấy_. Sự kiện `beforematch` kích hoạt, nội dung văn bản được cập nhật và phần tử trở nên hiển thị.
Lưu ý rằng mặc dù nội dung của phần tử bị ẩn, phần tử vẫn có một hộp được tạo ra, chiếm không gian trong bố cục và có background cùng border được hiển thị.

Để chạy lại ví dụ, nhấp "Reset".

{{EmbedLiveSample("Using until-found", "", 400)}}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{DOMxRef("HTMLElement.hidden")}}
- Tất cả [thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes)
- Thuộc tính [`aria-hidden`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-hidden)
- Sự kiện [`beforematch`](/en-US/docs/Web/API/Element/beforematch_event)
