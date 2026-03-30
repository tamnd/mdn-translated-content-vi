---
title: API bên thứ ba
slug: Learn_web_development/Extensions/Client-side_APIs/Third_party_APIs
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenu("Learn_web_development/Extensions/Client-side_APIs/Client-side_storage", "Learn_web_development/Extensions/Client-side_APIs")}}

Các API chúng ta đã đề cập cho đến nay được tích hợp sẵn trong trình duyệt, nhưng không phải tất cả các API đều như vậy. Nhiều trang web và dịch vụ lớn như Google Maps, Twitter, Facebook, PayPal, v.v. cung cấp các API cho phép các nhà phát triển sử dụng dữ liệu của họ (ví dụ: hiển thị luồng twitter của bạn trên blog của bạn) hoặc dịch vụ (ví dụ: sử dụng đăng nhập Facebook để đăng nhập người dùng của bạn). Bài viết này xem xét sự khác biệt giữa API trình duyệt và API bên thứ ba, và cho thấy một số cách sử dụng điển hình của loại sau.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        Quen thuộc với <a href="/en-US/docs/Learn_web_development/Core/Structuring_content">HTML</a>, <a href="/en-US/docs/Learn_web_development/Core/Styling_basics">CSS</a>, và <a href="/en-US/docs/Learn_web_development/Core/Scripting">JavaScript</a>, đặc biệt là <a href="/en-US/docs/Learn_web_development/Core/Scripting/Object_basics">kiến thức cơ bản về đối tượng JavaScript</a> và kiến thức cốt lõi về API như <a href="/en-US/docs/Learn_web_development/Core/Scripting/DOM_scripting">lập trình DOM</a> và <a href="/en-US/docs/Learn_web_development/Core/Scripting/Network_requests">Yêu cầu mạng</a>.
      </td>
    </tr>
    <tr>
      <th scope="row">Kết quả học tập:</th>
      <td>
        <ul>
          <li>Các khái niệm đằng sau API bên thứ ba và các mẫu liên quan như khóa API.</li>
          <li>Sử dụng API bản đồ bên thứ ba.</li>
          <li>Sử dụng API RESTful.</li>
          <li>Sử dụng API YouTube của Google.</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

## API bên thứ ba là gì?

API bên thứ ba là các API được cung cấp bởi các bên thứ ba — thường là các công ty như Facebook, Twitter hoặc Google — để cho phép bạn truy cập chức năng của họ qua JavaScript và sử dụng nó trên trang web của bạn. Một trong những ví dụ rõ ràng nhất là sử dụng các API bản đồ để hiển thị bản đồ tùy chỉnh trên các trang của bạn.

Hãy xem [ví dụ Mapquest API đơn giản](https://github.com/mdn/learning-area/tree/main/javascript/apis/third-party-apis/mapquest), và sử dụng nó để minh họa cách API bên thứ ba khác với API trình duyệt.

### Chúng được tìm thấy trên các máy chủ bên thứ ba

API trình duyệt được tích hợp vào trình duyệt — bạn có thể truy cập chúng từ JavaScript ngay lập tức. Ví dụ, Web Audio API mà chúng ta [đã thấy trong bài giới thiệu](/en-US/docs/Learn_web_development/Extensions/Client-side_APIs/Introduction#how_do_apis_work) được truy cập bằng đối tượng {{domxref("AudioContext")}} gốc. Ví dụ:

```js
const audioCtx = new AudioContext();
// …
const audioElement = document.querySelector("audio");
// …
const audioSource = audioCtx.createMediaElementSource(audioElement);
// etc.
```

Mặt khác, API bên thứ ba nằm trên các máy chủ bên thứ ba. Để truy cập chúng từ JavaScript, bạn trước tiên cần kết nối với chức năng API và làm cho nó có sẵn trên trang của bạn. Điều này thường liên quan đến việc đầu tiên liên kết đến một thư viện JavaScript có sẵn trên máy chủ qua phần tử {{htmlelement("script")}}, như đã thấy trong ví dụ Mapquest của chúng ta:

```html
<script
  src="https://api.mqcdn.com/sdk/mapquest-js/v1.3.2/mapquest.js"
  defer></script>
<link
  rel="stylesheet"
  href="https://api.mqcdn.com/sdk/mapquest-js/v1.3.2/mapquest.css" />
```

Sau đó bạn có thể bắt đầu sử dụng các đối tượng có sẵn trong thư viện đó. Ví dụ:

```js
const map = L.mapquest.map("map", {
  center: [53.480759, -2.242631],
  layers: L.mapquest.tileLayer("map"),
  zoom: 12,
});
```

### Chúng thường yêu cầu khóa API

Bảo mật cho API trình duyệt có xu hướng được xử lý bởi các lời nhắc quyền, như [đã thảo luận trong bài đầu tiên của chúng ta](/en-US/docs/Learn_web_development/Extensions/Client-side_APIs/Introduction#they_have_additional_security_mechanisms_where_appropriate). Mục đích của chúng là để người dùng biết những gì đang xảy ra trên các trang web họ truy cập và ít có khả năng trở thành nạn nhân của ai đó sử dụng API theo cách độc hại.

API bên thứ ba có một hệ thống quyền hơi khác — chúng có xu hướng sử dụng các khóa nhà phát triển để cho phép các nhà phát triển truy cập vào chức năng API, điều này bảo vệ nhà cung cấp API hơn là người dùng.

Bạn sẽ tìm thấy một dòng tương tự như sau trong ví dụ Mapquest API:

```js
L.mapquest.key = "YOUR-API-KEY-HERE";
```

Dòng này chỉ định một khóa API hoặc nhà phát triển để sử dụng trong ứng dụng của bạn — nhà phát triển của ứng dụng phải đăng ký để lấy khóa, sau đó bao gồm nó trong mã của họ để được phép truy cập vào chức năng của API. Trong ví dụ của chúng ta, chúng ta chỉ cung cấp một trình giữ chỗ.

> [!NOTE]
> Khi tạo ví dụ của riêng bạn, bạn sẽ sử dụng khóa API của riêng bạn thay cho bất kỳ trình giữ chỗ nào.

Yêu cầu khóa cho phép nhà cung cấp API giữ người dùng API chịu trách nhiệm về hành động của họ. Khi nhà phát triển đã đăng ký khóa, họ được biết đến với nhà cung cấp API, và có thể thực hiện hành động nếu họ bắt đầu làm bất cứ điều gì độc hại với API.

## Mở rộng ví dụ Mapquest

Hãy thêm một số chức năng hơn vào ví dụ Mapquest để trình bày cách sử dụng một số tính năng khác của API.

1. Để bắt đầu phần này, hãy tạo bản sao của [tệp khởi đầu mapquest](https://github.com/mdn/learning-area/blob/main/javascript/apis/third-party-apis/mapquest/start/index.html), trong thư mục mới. Nếu bạn đã sao chép [kho ví dụ](https://github.com/mdn/learning-area), bạn sẽ có sẵn một bản sao của tệp này, bạn có thể tìm thấy trong thư mục _javascript/apis/third-party-apis/mapquest/start_.
2. Tiếp theo, bạn cần truy cập [trang nhà phát triển Mapquest](https://developer.mapquest.com/), tạo tài khoản, sau đó tạo khóa nhà phát triển để sử dụng với ví dụ của bạn.
3. Mở tệp khởi đầu của bạn và thay thế trình giữ chỗ khóa API bằng khóa của bạn.

### Thay đổi loại bản đồ

Có một số loại bản đồ khác nhau có thể được hiển thị với Mapquest API. Để thực hiện điều này, hãy tìm dòng sau:

```js-nolint
layers: L.mapquest.tileLayer("map"),
```

Thử thay đổi `'map'` thành `'hybrid'` để hiển thị bản đồ kiểu hybrid.

### Thêm các điều khiển khác nhau

Bản đồ có một số điều khiển khác nhau; theo mặc định, nó chỉ hiển thị điều khiển zoom. Bạn có thể mở rộng các điều khiển có sẵn bằng cách sử dụng phương thức `map.addControl()`:

```js
map.addControl(L.mapquest.control());
```

### Thêm đánh dấu tùy chỉnh

Thêm đánh dấu (biểu tượng) tại một điểm nhất định trên bản đồ rất dễ dàng — bạn chỉ cần sử dụng phương thức [`L.marker()`](https://leafletjs.com/reference.html#marker). Thêm đoạn mã sau vào ví dụ của bạn:

```js
L.marker([53.480759, -2.242631], {
  icon: L.mapquest.icons.marker({
    primaryColor: "#22407F",
    secondaryColor: "#3B5998",
    shadow: true,
    size: "md",
    symbol: "A",
  }),
})
  .bindPopup("This is Manchester!")
  .addTo(map);
```

## API RESTful — NYTimes

Bây giờ hãy xem một ví dụ API khác — [New York Times API](https://developer.nytimes.com/). API này cho phép bạn truy xuất thông tin câu chuyện tin tức của New York Times và hiển thị trên trang web của bạn. Loại API này được gọi là **API RESTful** — thay vì nhận dữ liệu bằng các tính năng của thư viện JavaScript như chúng ta đã làm với Mapquest, chúng ta nhận dữ liệu bằng cách thực hiện các yêu cầu HTTP đến các URL cụ thể, với dữ liệu như thuật ngữ tìm kiếm và các thuộc tính khác được mã hóa trong URL (thường là tham số URL). Đây là mẫu phổ biến bạn sẽ gặp với các API.

### Tìm tài liệu

Khi bạn muốn sử dụng API bên thứ ba, điều cần thiết là tìm ra tài liệu ở đâu. Tài liệu New York Times API tại <https://developer.nytimes.com/>.

### Lấy khóa nhà phát triển

Hầu hết các API yêu cầu bạn sử dụng một loại khóa nhà phát triển nào đó. Để đăng ký khóa NYTimes API, hãy làm theo hướng dẫn tại <https://developer.nytimes.com/get-started>.

## Ví dụ YouTube

Chúng ta cũng đã xây dựng một ví dụ khác để bạn học hỏi — xem [ví dụ tìm kiếm video YouTube](https://mdn.github.io/learning-area/javascript/apis/third-party-apis/youtube/). Điều này sử dụng hai API liên quan:

- [YouTube Data API](https://developers.google.com/youtube/v3/docs/) để tìm kiếm video YouTube và trả về kết quả.
- [YouTube IFrame Player API](https://developers.google.com/youtube/iframe_api_reference) để hiển thị các ví dụ video được trả về bên trong trình phát video IFrame để bạn có thể xem chúng.

## Tóm tắt

Bài viết này đã cung cấp cho bạn phần giới thiệu hữu ích về việc sử dụng API bên thứ ba để thêm chức năng vào trang web của bạn.

{{PreviousMenu("Learn_web_development/Extensions/Client-side_APIs/Client-side_storage", "Learn_web_development/Extensions/Client-side_APIs")}}
