---
title: env()
slug: Web/CSS/Reference/Values/env
page-type: css-function
browser-compat: css.types.env
sidebar: cssref
---

Hàm **`env()`** [CSS](/vi/docs/Web/CSS) [function](/vi/docs/Web/CSS/Reference/Values/Functions) có thể được dùng để chèn giá trị của một [biến môi trường](/vi/docs/Web/CSS/Guides/Environment_variables/Using) do tác nhân người dùng định nghĩa vào CSS của bạn.

## Cú pháp

```css
/* Không có giá trị dự phòng */
env(safe-area-inset-top);
env(titlebar-area-width);
env(viewport-segment-right 0 0);

/* Có giá trị dự phòng */
env(safe-area-inset-right, 1em);
env(titlebar-area-y, 40px);
env(viewport-segment-width 0 0, 40%);
```

### Tham số

Hàm `env( <environment-variable>, <fallback> )` chấp nhận các tham số sau:

- [`<environment-variable>`](/vi/docs/Web/CSS/Guides/Environment_variables/Using#browser-defined_environment_variables)
  - : Một {{cssxref("&lt;custom-ident>")}} chỉ định tên của biến môi trường cần chèn. Nếu tên được cung cấp đại diện cho một biến môi trường dạng mảng, tên được theo sau bởi các giá trị {{cssxref("&lt;integer>")}} xác định trường hợp cụ thể mà tên đang tham chiếu. Tên biến môi trường phân biệt chữ hoa/thường có thể là một trong các giá trị sau:
    - `safe-area-inset-top`, `safe-area-inset-right`, `safe-area-inset-bottom`, `safe-area-inset-left`
      - : Khoảng cách an toàn từ cạnh trên, phải, dưới hoặc trái của viewport, xác định nơi an toàn để đặt nội dung mà không bị cắt bởi hình dạng màn hình không hình chữ nhật. Bốn giá trị tạo thành một hình chữ nhật, bên trong đó tất cả nội dung đều hiển thị. Các giá trị là `0` nếu viewport là hình chữ nhật và không có tính năng nào — như thanh công cụ hoặc bàn phím động — chiếm không gian viewport; ngược lại, đó là giá trị `px` lớn hơn `0`.
    - `safe-area-max-inset-top`, `safe-area-max-inset-right`, `safe-area-max-inset-bottom`, `safe-area-max-inset-left`
      - : Các giá trị tối đa tĩnh của các biến `safe-area-inset-*` động tương ứng khi tất cả các tính năng giao diện người dùng động được thu lại. Trong khi các giá trị `safe-area-inset-*` thay đổi theo vùng nội dung hiện đang hiển thị, các giá trị `safe-area-max-inset-*` là hằng số.
    - `titlebar-area-x`, `titlebar-area-y`, `titlebar-area-width`, `titlebar-area-height`
      - : Kích thước của vùng `titlebar-area-*` hiển thị. Các biến này khả dụng khi sử dụng trường `window-controls-overlay` [`display_override`](/vi/docs/Web/Progressive_web_apps/Manifest/Reference/display_override) trong manifest. Các giá trị của biến có thể được dùng để đảm bảo nội dung không chồng lên các nút điều khiển cửa sổ (tức là thu nhỏ, phóng to và đóng) đối với ứng dụng web lũy tiến (PWA) được cài đặt trên thiết bị máy tính.
    - `keyboard-inset-top`, `keyboard-inset-right`, `keyboard-inset-bottom`, `keyboard-inset-left`, `keyboard-inset-width`, `keyboard-inset-height`
      - : Các phần lề từ cạnh viewport và kích thước của bàn phím ảo trên thiết bị. Được định nghĩa trong {{domxref("VirtualKeyboard API", "VirtualKeyboard API", "", "nocode")}}.
    - `viewport-segment-width`, `viewport-segment-height`, `viewport-segment-top`, `viewport-segment-right`, `viewport-segment-bottom`, `viewport-segment-left`
      - : Kích thước và vị trí offset của các đoạn viewport cụ thể. Từ khóa `viewport-segment-*` được theo sau bởi hai giá trị {{cssxref("&lt;integer>")}} cách nhau bởi khoảng trắng chỉ vị trí ngang và dọc của đoạn, hay chỉ số. Các từ khóa viewport-segment chỉ được định nghĩa khi viewport được tạo thành từ hai đoạn trở lên, như với các thiết bị có thể gập hoặc có bản lề.

- `<fallback>` {{optional_inline}}
  - : Giá trị dự phòng được chèn nếu biến môi trường được tham chiếu trong đối số đầu tiên không tồn tại. Mọi thứ sau dấu phẩy đầu tiên được coi là giá trị dự phòng. Đây có thể là một giá trị đơn, một hàm `env()` khác, hoặc danh sách các giá trị cách nhau bởi dấu phẩy.

## Mô tả

Hàm `env()` được dùng để chèn giá trị của [biến môi trường do tác nhân người dùng định nghĩa](/vi/docs/Web/CSS/Guides/Environment_variables/Using#browser-defined_environment_variables) có phạm vi toàn cục vào CSS của bạn. Hàm `env()` có thể được dùng làm giá trị thuộc tính hoặc thay thế cho bất kỳ phần nào của giá trị thuộc tính hay mô tả (ví dụ: trong [các quy tắc Media query](/vi/docs/Web/CSS/Reference/At-rules/@media)).

Hàm chấp nhận `<environment-variable>` làm đối số đầu tiên. Đây là {{cssxref("&lt;custom-ident>")}} phân biệt chữ hoa/thường tương đương với [tên của biến môi trường](/vi/docs/Web/CSS/Guides/Environment_variables/Using#browser-defined_environment_variables) cần thay thế, nhưng nó cũng có thể bao gồm các giá trị cách nhau bởi khoảng trắng bổ sung nếu cần. Ví dụ, `env(viewport-segment-width 0 0)` sẽ trả về chiều rộng của đoạn trên cùng hoặc bên trái trong trường hợp thiết bị có nhiều đoạn viewport.

Đối số thứ hai, nếu được cung cấp, là giá trị dự phòng, được dùng nếu biến môi trường được tham chiếu trong đối số đầu tiên không được hỗ trợ hoặc không tồn tại. Giá trị dự phòng có thể là một biến môi trường khác, thậm chí có giá trị dự phòng riêng của nó.

Cú pháp của giá trị dự phòng tương tự như cú pháp dự phòng của hàm {{cssxref("var()")}} dùng để chèn [thuộc tính tùy chỉnh CSS](/vi/docs/Web/CSS/Reference/Properties/--*) ở chỗ nó cho phép nhiều dấu phẩy. Bất cứ thứ gì giữa dấu phẩy đầu tiên và cuối hàm được coi là giá trị dự phòng. Tuy nhiên, nếu hàm `env()` được dùng trong giá trị thuộc tính hoặc mô tả không bao gồm dấu phẩy, giá trị dự phòng có dấu phẩy sẽ không hợp lệ.

Một thuộc tính hoặc mô tả chứa hàm `env()` có cú pháp hợp lệ được coi là hợp lệ tại thời điểm phân tích cú pháp, khi trình duyệt lần đầu đọc và diễn giải văn bản CSS đã tải xuống. Nó chỉ được kiểm tra cú pháp tại thời điểm tính toán, sau khi mỗi hàm `env()` đã được thay thế bằng giá trị do trình duyệt cung cấp (hoặc giá trị dự phòng nếu biến môi trường được truyền vào dưới dạng tham số đầu tiên không phải là tên biến môi trường được nhận dạng). Nếu giá trị không hợp lệ và không có giá trị dự phòng, thuộc tính hoặc mô tả chứa hàm `env()` là [không hợp lệ tại thời điểm giá trị tính toán](/vi/docs/Web/CSS/Guides/Syntax/Error_handling#invalid_custom_properties).

Khi thay thế `env()` không hợp lệ và một giá trị dự phòng không hợp lệ được bao gồm, hoặc giá trị dự phòng bị bỏ qua, khai báo không bị bỏ qua. Thay vào đó, giá trị [ban đầu](/vi/docs/Web/CSS/Guides/Cascade/Property_value_processing#initial_value) hoặc [kế thừa](/vi/docs/Web/CSS/Guides/Cascade/Inheritance) của thuộc tính được dùng. Thuộc tính được đặt thành một giá trị mới, nhưng có thể không phải là giá trị mong đợi.

### Trường hợp sử dụng

Ban đầu được cung cấp bởi trình duyệt iOS để cho phép các nhà phát triển đặt nội dung của họ vào vùng an toàn của viewport và không bị che khuất bởi các nốt hoặc góc bo tròn của thiết bị, các giá trị `safe-area-inset-*` có thể được dùng để giúp đảm bảo nội dung hiển thị với người xem. Tính năng này sau đó đã được mở rộng ra ngoài mục đích ban đầu để cho phép các trường hợp sử dụng như [ngăn thông báo thiết bị che khuất một phần giao diện ứng dụng](#using_env_to_ensure_buttons_are_not_obscured_by_device_ui).

Một trường hợp sử dụng khác cho các biến `env()` là dành cho [Progressive web apps](/vi/docs/Web/Progressive_web_apps) (PWA) trên máy tính sử dụng tính năng [Window Controls Overlay](/vi/docs/Web/API/Window_Controls_Overlay_API) để tận dụng toàn bộ diện tích cửa sổ ứng dụng. Sử dụng các giá trị [`titlebar-area-*`](#titlebar-area-x), các nhà phát triển có thể định vị các phần tử ở nơi thanh tiêu đề thường được hiển thị và [đảm bảo nội dung không bị che khuất bởi các nút điều khiển cửa sổ](#using_env_to_ensure_content_is_not_obscured_by_window_control_buttons_in_desktop_pwas).

Các tên biến `viewport-segment-*` có thể được dùng để đặt các container vừa khít vào các đoạn có sẵn của thiết bị có nhiều đoạn viewport như thiết bị có bản lề hoặc có thể gập. Các số nguyên theo sau tên `viewport-segment-*` chỉ đoạn nào trong nhiều đoạn mà biến môi trường đang tham chiếu.

### Tên được theo sau bởi các số nguyên

Khi biến môi trường có dạng mảng, nghĩa là tên có thể tham chiếu nhiều hơn một giá trị, chẳng hạn như trường hợp của các thiết bị có nhiều đoạn viewport, tham số `<environment-variable>` bao gồm cả tên biến và chỉ số của trường hợp cụ thể của biến mà hàm đang tham chiếu. Ví dụ, trong trường hợp các biến `viewport-segment-*`, tên biến được truyền vào hàm `env()` cùng với hai số nguyên chỉ các chỉ số của đoạn để trả về giá trị. Các giá trị này đều là số nguyên `0` hoặc lớn hơn. Số nguyên đầu tiên đại diện cho chỉ số ngang của đoạn, với `0` là đoạn ngoài cùng bên trái, và giá trị thứ hai đại diện cho chỉ số dọc của đoạn, với `0` đại diện cho đoạn dưới cùng:

![Hai bố cục đoạn thiết bị; trong bố cục nằm ngang, 0 0 là đoạn đầu tiên và 1 0 là đoạn thứ hai. Trong bố cục dọc, các chỉ số là 0 0 và 0 1](env-var-indices.png)

- Trong bố cục nằm ngang cạnh nhau, đoạn bên trái được đại diện bởi `0 0`, và đoạn bên phải được đại diện bởi `1 0`.
- Trong bố cục dọc từ trên xuống dưới, đoạn trên được đại diện bởi `0 0`, và đoạn dưới được đại diện bởi `0 1`.
- Trong các thiết bị có nhiều hơn hai đoạn, các số có thể lớn hơn. Ví dụ, một thiết bị có ba đoạn ngang có thể có đoạn giữa được đại diện bởi `1 0`, và đoạn bên phải được đại diện bởi `2 0`.

Ví dụ, đoạn sau trả về chiều rộng của đoạn bên phải trên thiết bị có thể gập với hai đoạn được định hướng nằm ngang:

```css
env(viewport-segment-width 1 0)
```

Xem [demo Viewport segment API](https://mdn.github.io/dom-examples/viewport-segments-api/) để biết bản demo hoạt động đầy đủ ([mã nguồn](https://github.com/mdn/dom-examples/tree/main/viewport-segments-api)). Cũng hãy xem [Using the Viewport Segments API](/vi/docs/Web/API/Viewport_segments_API/Using) để biết giải thích demo đầy đủ.

## Cú pháp chính thức

{{CSSSyntax}}

## Ví dụ

### Sử dụng env() để đảm bảo các nút không bị che bởi giao diện thiết bị

Trong ví dụ sau, `env()` được dùng để đảm bảo rằng các nút thanh công cụ ứng dụng cố định không bị che bởi các thông báo thiết bị xuất hiện ở dưới cùng màn hình. Trên máy tính, `safe-area-inset-bottom` là `0`. Tuy nhiên, trong các thiết bị hiển thị thông báo ở dưới cùng màn hình, chẳng hạn như iOS, nó chứa giá trị để lại khoảng trống cho thông báo hiển thị. Điều này sau đó có thể được dùng trong giá trị cho {{cssxref("padding-bottom")}} để tạo ra khoảng cách tự nhiên trên thiết bị đó.

#### HTML

Chúng ta có một phần {{htmlelement("main")}} chứa ứng dụng giả và một {{htmlelement("footer")}} chứa hai phần tử {{htmlelement("button")}}:

```html
<main>Main content of app here</main>
<footer>
  <button>Go here</button>
  <button>Or here</button>
</footer>
```

#### CSS

Sử dụng [bố cục hộp linh hoạt CSS](/vi/docs/Web/CSS/Guides/Flexible_box_layout), chúng ta tạo ra một footer chỉ cao bằng mức cần thiết, trong khi phần chính chứa ứng dụng lấp đầy phần còn lại của viewport:

```css
body {
  display: flex;
  flex-direction: column;
  min-height: 100vh;
  font: 1em system-ui;
}

main {
  flex: 1;
  background-color: #eeeeee;
  padding: 1em;
}

footer {
  flex: none;
  display: flex;
  gap: 1em;
  justify-content: space-evenly;
  background: black;
}

button {
  padding: 1em;
  background: white;
  color: black;
  margin: 0;
  width: 100%;
  border: none;
  font: 1em system-ui;
}
```

Chúng ta đặt [`position: sticky`](/vi/docs/Web/CSS/Reference/Properties/position#sticky) để ghim footer xuống dưới cùng của viewport. Sau đó chúng ta dùng thuộc tính rút gọn {{cssxref("padding")}} để thêm padding vào footer. Chúng ta bao gồm giá trị của biến môi trường `safe-area-inset-bottom` vào `1em` padding dưới ban đầu. Một vùng đen lớn hơn sẽ hiển thị trên các thiết bị có giá trị dương cho biến này, đảm bảo các nút trong footer không bao giờ bị che khuất.

```css
footer {
  position: sticky;
  bottom: 0;

  padding: 1em 1em calc(1em + env(safe-area-inset-bottom));
}
```

#### Kết quả

{{EmbedLiveSample("Using_env_to_ensure_buttons_are_not_obscured_by_device_UI", "200px", "500px")}}

### Sử dụng giá trị dự phòng

Ví dụ này sử dụng tham số thứ hai tùy chọn của `env()`, cung cấp giá trị dự phòng trong trường hợp biến môi trường không khả dụng.

#### HTML

Chúng ta thêm một đoạn văn bản:

```html
<p>
  If the <code>env()</code> function is supported in your browser, this
  paragraph's text will have 50px of padding between it and the left border —
  but not the top, right and bottom. This is because the accompanying CSS is the
  equivalent of <code>padding: 0 0 0 50px</code>, because, unlike other CSS
  properties, user agent property names are case-sensitive.
</p>
```

#### CSS

Chúng ta đặt {{cssxref("width")}} là `300px` và một {{cssxref("border")}}. Sau đó chúng ta thêm {{cssxref("padding")}}, sử dụng hàm `env()` với giá trị dự phòng cho kích thước padding ở mỗi cạnh. Chúng ta cố tình đặt giá trị không hợp lệ cho padding bên trái (nhớ rằng, tên biến môi trường phân biệt chữ hoa/thường), để minh họa việc sử dụng giá trị dự phòng.

```css
p {
  width: 300px;
  border: 2px solid red;
  padding: env(safe-area-inset-top, 50px) env(safe-area-inset-right, 50px)
    env(safe-area-inset-bottom, 50px) env(SAFE-AREA-INSET-LEFT, 50px);
}
```

#### Kết quả

{{EmbedLiveSample("Using_the_fallback_value", "350px", "250px")}}

### Sử dụng env() để đảm bảo nội dung không bị che bởi các nút điều khiển cửa sổ trong PWA trên máy tính

Trong ví dụ sau, `env()` đảm bảo rằng nội dung hiển thị trong Progressive Web App trên máy tính sử dụng [Window Controls Overlay API](/vi/docs/Web/API/Window_Controls_Overlay_API) không bị che bởi các nút điều khiển cửa sổ của hệ điều hành. Các giá trị `titlebar-area-*` định nghĩa một hình chữ nhật nơi thanh tiêu đề thường được hiển thị. Trên các thiết bị không hỗ trợ tính năng Window Controls Overlay, chẳng hạn như thiết bị di động, các giá trị dự phòng được dùng.

Đây là giao diện thông thường của một PWA được cài đặt trên máy tính:

![Minh họa giao diện thông thường của PWA được cài đặt trên máy tính, với các nút điều khiển cửa sổ, thanh tiêu đề và nội dung web bên dưới](desktop-pwa-window.png)

Với tính năng Window Controls Overlay, nội dung web bao phủ toàn bộ diện tích cửa sổ ứng dụng, với các nút điều khiển cửa sổ và các nút PWA được hiển thị dưới dạng overlay:

![Minh họa giao diện PWA được cài đặt trên máy tính với tính năng Window Controls Overlay, với các nút điều khiển cửa sổ, không có thanh tiêu đề và nội dung web trải dài toàn bộ cửa sổ](desktop-pwa-window-wco.png)

```html
<header>Title of the app here</header>
<main>Main content of app here</main>
```

```css
header {
  position: fixed;
  left: env(titlebar-area-x);
  top: env(titlebar-area-y);
  width: env(titlebar-area-width);
  height: env(titlebar-area-height);
}

main {
  margin-top: env(titlebar-area-height);
}
```

> [!NOTE]
> Sử dụng `position:fixed` đảm bảo header không cuộn cùng với phần còn lại của nội dung, và thay vào đó luôn căn chỉnh với các nút điều khiển cửa sổ, ngay cả trên thiết bị/trình duyệt hỗ trợ overscroll đàn hồi (còn gọi là rubber banding).

### Các đoạn viewport

[Demo Viewport segment API](https://mdn.github.io/dom-examples/viewport-segments-api/) và hướng dẫn [Using the Viewport Segments API](/vi/docs/Web/API/Viewport_segments_API/Using) cung cấp minh họa và giải thích về việc sử dụng hàm `env()` với các biến môi trường `viewport-segments-*`.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Using environment variables](/vi/docs/Web/CSS/Guides/Environment_variables/Using)
- [CSS environment variables](/vi/docs/Web/CSS/Guides/Environment_variables) module
- {{CSSxRef("var")}}
- [CSS custom properties for cascading variables](/vi/docs/Web/CSS/Guides/Cascading_variables) module
- [Custom properties (`--*`): CSS variables](/vi/docs/Web/CSS/Reference/Properties/--)
- [Using CSS custom properties (variables)](/vi/docs/Web/CSS/Guides/Cascading_variables/Using_custom_properties)
- [Viewport Segments API](/vi/docs/Web/API/Viewport_segments_API)
- [Customize the window controls overlay of your PWA's title bar](https://web.dev/articles/window-controls-overlay)
- [Display content in the title bar](https://learn.microsoft.com/en-us/microsoft-edge/progressive-web-apps/how-to/window-controls-overlay)
- [Breaking Out of the Box](https://alistapart.com/article/breaking-out-of-the-box/)
