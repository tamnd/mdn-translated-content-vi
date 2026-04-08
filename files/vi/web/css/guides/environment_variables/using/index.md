---
title: Using environment variables
slug: Web/CSS/Guides/Environment_variables/Using
page-type: guide
sidebar: cssref
---

[Module CSS environment variables](/en-US/docs/Web/CSS/Guides/Environment_variables) giới thiệu khái niệm environment variables trong CSS và định nghĩa hàm {{cssxref("env")}} để cho phép sử dụng environment variables. Trong hướng dẫn này, chúng ta xem xét [environment variables là gì](#what_are_environment_variables), [các environment variables được định nghĩa bởi trình duyệt](#browser-defined_environment_variables), và [cách sử dụng environment variables](#using_environment_variables_with_env_example) với [hàm `env()`](#the_env_function).

## Environment variables là gì?

CSS environment variables là các biến toàn cục; có phạm vi toàn cục trên toàn bộ tài liệu. Chúng được định nghĩa bởi user agent. Environment variables là các giá trị đặc biệt được cung cấp bởi trình duyệt hoặc hệ điều hành giúp styles của bạn thích ứng với thiết bị hoặc ngữ cảnh của người dùng. Chúng được truy cập bằng hàm `env()`.

Environment variables hoạt động tương tự như [custom properties](/en-US/docs/Web/CSS/Reference/Properties/--*) và hàm {{cssxref("var()")}}, nhưng được định nghĩa toàn cục và có phạm vi. Điều này có nghĩa là chúng luôn có phạm vi trên toàn bộ tài liệu, không giống như custom properties, có phạm vi trên các phần tử. Ngoài ra, environment variables là read-only, trong khi custom properties có thể thay đổi được.

Tương tự như custom properties, environment variables phân biệt hoa thường. Không giống như custom properties, không thể sử dụng bên ngoài các khai báo, hàm `env()` có thể được sử dụng thay thế cho bất kỳ phần nào của giá trị thuộc tính, hoặc bất kỳ phần nào của một descriptor (ví dụ trong [Media query rules](/en-US/docs/Web/CSS/Reference/At-rules/@media)).

### Lịch sử

Apple lần đầu tiên giới thiệu environment variables trong trình duyệt iOS Safari để cho phép các nhà phát triển tối ưu hóa layouts cho các màn hình thiết bị không thông thường. Ví dụ bao gồm các thiết bị có notch và cạnh cong. Các environment variables `safe-area-inset-*` ban đầu cho phép các nhà phát triển đặt nội dung trong vùng an toàn của viewport bất kể thiết bị hoặc trình duyệt nào người dùng có.

### Các trường hợp sử dụng

Các vấn đề phổ biến có thể được giải quyết bằng cách sử dụng environment variables bao gồm:

- Thông báo thiết bị che khuất các phần của giao diện người dùng ứng dụng.
- Xử lý thay đổi kích thước viewport khi các bàn phím động được hiển thị và ẩn.
- Định vị các phần tử nơi thanh tiêu đề sẽ đã có trên [progressive web apps](/en-US/docs/Web/Progressive_web_apps) (PWAs) sau khi chúng được cài đặt và đảm bảo nội dung không bị che khuất bởi các nút điều khiển cửa sổ. Đây đặc biệt là vấn đề trên các trình duyệt desktop.

## Các environment variables được định nghĩa bởi trình duyệt

Đặc tả CSS environment variables định nghĩa một số biến phân biệt hoa thường, bao gồm:

- `preferred-text-scale`
  - : Environment variable `preferred-text-scale` đại diện cho hệ số tỷ lệ văn bản ưa thích của người dùng. Đây là sự điều chỉnh được thực hiện đối với cỡ chữ "mặc định" của hệ điều hành hoặc user agent. Trên các thiết bị và trình duyệt nơi {{cssxref("text-size-adjust")}} có hiệu lực, đây là hệ số tỷ lệ được áp dụng bởi `text-size-adjust: auto`. Ví dụ, nếu `text-size-adjust: auto` sẽ làm tăng gấp đôi kích thước văn bản, thì `env(preferred-text-scale)` sẽ trả về `2`.

- `safe-area-inset-*`
  - : Bốn environment variables safe area inset — `safe-area-inset-top`, `safe-area-inset-right`, `safe-area-inset-bottom` và `safe-area-inset-left` — xác định một hình chữ nhật safe area bằng các insets trên, phải, dưới và trái từ cạnh viewport. An toàn khi đặt nội dung bên trong vùng này mà không bị cắt xén bởi hình dạng của màn hình không hình chữ nhật. Đối với các viewport hình chữ nhật, không bị che khuất, chẳng hạn như màn hình máy tính để bàn và laptop thông thường, bốn giá trị này đều bằng `0`. Đối với màn hình không hình chữ nhật — bao gồm các thiết bị có góc bo tròn với màn hình toàn kích thước và đồng hồ thông minh tròn hoặc [round-display](/en-US/docs/Web/CSS/Guides/Round_display) — bốn giá trị này, được đặt bởi user agent, tạo thành một hình chữ nhật sao cho tất cả nội dung bên trong hình chữ nhật là hiển thị và không bị che khuất.

- `safe-area-max-inset-*`
  - : Bốn environment variables safe area maximum inset — `safe-area-max-inset-top`, `safe-area-max-inset-right`, `safe-area-max-inset-bottom` và `safe-area-max-inset-left` — mỗi cái đại diện cho giá trị tối đa tĩnh của các biến động `safe-area-inset-*` tương ứng. Chúng đại diện cho giá trị tối đa của `safe-area-inset-*` tương ứng khi tất cả các tính năng giao diện người dùng động đã thu lại. Ví dụ, trên một số nền tảng có thể có thanh nút hiển thị khi cuộn lên hoặc xuống, thay đổi giá trị `safe-area-inset-*`. Trong khi giá trị `safe-area-inset-*` thay đổi khi vùng nội dung hiển thị hiện tại thay đổi, giá trị `safe-area-max-inset-*` luôn giữ nguyên.

- `viewport-segment-*`
  - : Các biến này chỉ liên quan đến các thiết bị có nhiều phân đoạn, chẳng hạn như điện thoại gập được. Các biến `viewport-segment-bottom`, `viewport-segment-left`, `viewport-segment-right` và `viewport-segment-top`, cùng với `viewport-segment-height` và `viewport-segment-width`, xác định vị trí và kích thước của các vùng được phân tách logic của viewport. Các biến này chỉ được định nghĩa nếu viewport được chia thành ít nhất hai phân đoạn. Chúng được sử dụng để đặt các phần khác nhau của UI một cách thoải mái vào các phân đoạn khác nhau của thiết bị đa phân đoạn và tránh nội dung bị cắt bởi chỗ gập.

Các đặc tả khác định nghĩa thêm environment variables.

[Window Controls Overlay API](/en-US/docs/Web/API/Window_Controls_Overlay_API) định nghĩa interface {{domxref("WindowControlsOverlay")}}, hiển thị thông tin về hình học của vùng thanh tiêu đề trong [progressive web applications (PWAs)](/en-US/docs/Glossary/Progressive_web_apps) được cài đặt trên các thiết bị desktop. Khi sử dụng giá trị [display_override](/en-US/docs/Web/Progressive_web_apps/Manifest/Reference/display_override) `window-controls-overlay`, các environment variables sau được định nghĩa:

- `titlebar-area-*`
  - : Các biến `titlebar-area-x`, `titlebar-area-y`, `titlebar-area-width` và `titlebar-area-height` xác định vùng thường được thanh tiêu đề chiếm trong một ứng dụng web được cài đặt chạy trên môi trường desktop. Sử dụng các biến `titlebar-area-*` để đảm bảo nội dung không chồng lên các nút điều khiển cửa sổ (tức là minimize, maximize và close).

- `keyboard-inset-*`
  - : Các biến `keyboard-inset-top`, `keyboard-inset-right`, `keyboard-inset-bottom`, `keyboard-inset-left`, `keyboard-inset-width` và `keyboard-inset-height` cung cấp thông tin về vị trí và kích thước của bàn phím ảo trên màn hình, cụ thể là các insets trên, phải, dưới và trái từ cạnh viewport (các insets chiều rộng và chiều cao được tính từ các insets khác). Để tìm hiểu thêm, xem {{domxref("VirtualKeyboard API", "VirtualKeyboard API", "", "nocode")}}.

Bạn có thể nhận thấy rằng tất cả các tên biến trước đó bao gồm các thuật ngữ vật lý left, right, top, bottom, height và width. Các tương đương logic không cần thiết vì các tên biến đề cập đến các thuộc tính vật lý của phần cứng thiết bị chứ không phải trang web được hiển thị.

## Hàm `env()`

Hàm {{cssxref("env")}} được sử dụng để chèn giá trị của một environment variable vào ngữ cảnh CSS. Hàm `env()` có thể được sử dụng thay cho bất kỳ phần nào của giá trị trong bất kỳ thuộc tính nào trên bất kỳ phần tử nào, hoặc bất kỳ phần nào của giá trị trong bất kỳ descriptor nào trên bất kỳ at-rule nào, bao gồm cả trong các giá trị custom property. Nó có thể được sử dụng ở bất cứ đâu một giá trị CSS được cho phép.

Cú pháp cơ bản như sau:

```css-nolint
env( <environment-variable-name> )
env( <environment-variable-name>, <fallback-value> )
```

Hàm chấp nhận một [tên environment variable](#browser-defined_environment_variables) phân biệt hoa thường và một giá trị fallback tùy chọn, nhưng thường được khuyến nghị.

```css
line-height: env(preferred-text-scale, 2);
margin: env(safe-area-inset-top, 0) env(safe-area-inset-right, auto)
  env(safe-area-inset-bottom, 3em) env(safe-area-inset-left, auto);
```

Đối số đầu tiên là [tên của environment variable](#browser-defined_environment_variables) cần được thay thế. Đối số sau dấu phẩy, nếu được cung cấp, là giá trị fallback, được sử dụng nếu environment variable được tham chiếu trong đối số đầu tiên không tồn tại. Trong các ví dụ này, nếu environment variable `preferred-text-scale` không tồn tại trong một trình duyệt, {{cssxref("line-height")}} sẽ được đặt thành `2`. Và nếu trình duyệt không có giá trị `safe-area-inset-*`, {{cssxref("margin")}} sẽ được đặt thành `margin: 0 auto 3em auto`.

Cú pháp của fallback tương tự như cú pháp custom properties ở chỗ nó cho phép nhiều dấu phẩy. Bất kỳ thứ gì giữa dấu phẩy đầu tiên và cuối hàm đều được coi là giá trị fallback. Tuy nhiên, nếu giá trị thuộc tính hoặc descriptor không hỗ trợ dấu phẩy, giá trị không hợp lệ.

Nếu một thuộc tính hoặc descriptor chứa các hàm `env()` hợp lệ về cú pháp, nó được coi là hợp lệ tại thời điểm phân tích cú pháp. Nó chỉ được kiểm tra cú pháp tại thời điểm tính toán, sau khi các hàm `env()` đã được thay thế bằng các giá trị do trình duyệt cung cấp. Nếu environment variable được truyền dưới dạng tham số đầu tiên không phải là tên environment variable được nhận dạng, giá trị fallback sẽ được sử dụng. Fallback có thể là một environment variable khác, thậm chí với fallback của chính nó. Nếu không có fallback nào được cung cấp, thuộc tính hoặc descriptor chứa hàm `env()` không hợp lệ tại thời điểm giá trị tính toán.

## Ví dụ sử dụng environment variables với `env()`

Chúng ta có thể sử dụng environment variables để đảm bảo rằng thanh toolbar ứng dụng cố định không bị che khuất bởi các thông báo xuất hiện ở cuối thiết bị. Trên các thiết bị hiển thị thông báo ở cuối màn hình, user agent sẽ đặt giá trị của environment variable `safe-area-inset-bottom` là khoảng cách từ trên cùng của những gì đang chặn viewport đến cuối viewport; trong ví dụ của chúng ta, đây có thể là chiều cao của bất kỳ thông báo hiển thị nào. Trên màn hình desktop hình chữ nhật, `safe-area-inset-bottom` thường là `0`. Chúng ta sẽ sử dụng giá trị này để tạo khoảng trống ở cuối viewport để thông báo có thể hiển thị mà không che khuất nội dung.

{{htmlelement("body")}} của chúng ta có hai phần tử con; {{htmlelement("main")}} chứa toàn bộ ứng dụng ngoại trừ thanh toolbar {{htmlelement("footer")}}.

```html
<body>
  <main>Application</main>
  <footer>Toolbar</footer>
</body>
```

`<body>` được định nghĩa là flex container lấp đầy chiều cao của viewport. `<main>` ứng dụng được phép tăng trưởng để lấp đầy bất kỳ khoảng trống nào không bị chiếm bởi `<footer>` là sibling của nó.

```css
body {
  display: flex;
  flex-flow: column nowrap;
  height: 100vh;
}

main {
  flex: 1;
  padding: 1em;
  overflow-y: auto;
}
```

`<footer>` được định vị để gắn vào cuối viewport. Khai báo [`position: sticky`](/en-US/docs/Web/CSS/Reference/Properties/position#sticky) dịch chuyển phần tử tương đối với `<body>` (scrolling ancestor và [containing block](/en-US/docs/Web/CSS/Guides/Display/Containing_block) của nó), dựa trên giá trị {{cssxref("bottom")}} là `0`. Chúng ta đặt `<footer>` một giá trị {{cssxref("padding")}} là `1em` trên tất cả bốn cạnh. Sau đó chúng ta thêm giá trị `safe-area-inset-bottom` vào `1em` của bottom padding, với fallback là `1em`.

```css
footer {
  position: sticky;
  bottom: 0;
  padding: 1em;
  padding-bottom: calc(1em + env(safe-area-inset-bottom, 1em));
}
```

CSS bổ sung được ẩn cho ngắn gọn.

```css hidden
main {
  background-color: palegoldenrod;
}
footer {
  background-color: black;
  color: white;
  border-top: 1px solid white;
  display: flex;
  justify-content: space-between;
}

footer::before,
footer::after {
  content: "Button" / "Fake button";
  padding: 3px 0.5em;
  background: white;
  color: black;
  border-radius: 3px;
}
```

Bottom padding của footer sẽ mở rộng vượt quá `1em` trên các thiết bị có environment variable `safe-area-inset-bottom` với giá trị lớn hơn `0`. CSS này cung cấp thêm padding để tăng trưởng footer khi cần, dù vì thông báo, notch trên màn hình thiết bị, hoặc vì thiết bị không có góc vuông.

{{EmbedLiveSample("Using environment variables with env example", "200", "500")}}

Trong tương lai, chúng ta có thể thấy hỗ trợ cho các environment variables do nhà phát triển định nghĩa, nhưng điều này chưa được định nghĩa hoặc triển khai.

## Xem thêm

- {{cssxref("var")}}
- [`@media` `shape` descriptor](/en-US/docs/Web/CSS/Reference/At-rules/@media/shape)
- [CSS environment_variables](/en-US/docs/Web/CSS/Guides/Environment_variables) module
- [CSS round display](/en-US/docs/Web/CSS/Guides/Round_display) module
- [CSS custom properties for cascading variables](/en-US/docs/Web/CSS/Guides/Cascading_variables) module
