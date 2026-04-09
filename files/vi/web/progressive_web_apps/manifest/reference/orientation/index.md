---
title: orientation
slug: Web/Progressive_web_apps/Manifest/Reference/orientation
page-type: web-manifest-member
browser-compat: manifests.webapp.orientation
sidebar: pwasidebar
---

Member manifest `orientation` được dùng để chỉ định hướng mặc định cho ứng dụng web của bạn.
Nó xác định cách ứng dụng nên được hiển thị khi khởi chạy và trong khi sử dụng, liên quan đến hướng màn hình của thiết bị, đặc biệt trên các thiết bị hỗ trợ nhiều hướng.

> [!NOTE]
> Hướng của ứng dụng có thể được thay đổi trong lúc chạy thông qua nhiều cách khác nhau, chẳng hạn dùng [Screen Orientation API](/en-US/docs/Web/API/Screen_Orientation_API).

## Cú pháp

```json-nolint
/* Giá trị từ khóa */
"orientation": "any"
"orientation": "natural"
"orientation": "portrait"
"orientation": "portrait-primary"
"orientation": "portrait-secondary"
"orientation": "landscape"
"orientation": "landscape-primary"
"orientation": "landscape-secondary"
```

### Giá trị

- `orientation`
  - : Một chuỗi chỉ định hướng mặc định cho ứng dụng web.
    Nếu member `orientation` không được chỉ định hoặc giá trị không hợp lệ được cung cấp, ứng dụng web thường sẽ dùng hướng tự nhiên của thiết bị và mọi cài đặt hướng ở cấp người dùng hoặc hệ thống.

    Giá trị `orientation` phải là một trong các từ khóa sau:
    - `any`
      - : Hiển thị ứng dụng web theo bất kỳ hướng nào được hệ điều hành của thiết bị hoặc cài đặt người dùng cho phép.
        Nó cho phép ứng dụng xoay tự do để khớp với hướng của thiết bị khi thiết bị bị xoay.

    - `natural`
      - : Hiển thị ứng dụng web theo hướng được xem là tự nhiên nhất cho thiết bị, do trình duyệt, hệ điều hành, cài đặt người dùng, hoặc chính màn hình xác định. Nó tương ứng với cách thiết bị thường được cầm hoặc dùng:
        - Trên các thiết bị thường cầm theo chiều dọc, như điện thoại di động, `natural` thường là `portrait-primary`.
        - Trên các thiết bị thường dùng theo chiều ngang, như màn hình máy tính và máy tính bảng, `natural` thường là `landscape-primary`.

        Khi thiết bị bị xoay, ứng dụng có thể xoay hoặc không để khớp với hướng tự nhiên của thiết bị; hành vi này có thể thay đổi tùy theo thiết bị cụ thể, triển khai của trình duyệt, và cài đặt người dùng.

    - `portrait`
      - : Hiển thị ứng dụng web với chiều cao lớn hơn chiều rộng.
        Nó cho phép ứng dụng chuyển giữa các hướng `portrait-primary` và `portrait-secondary` khi thiết bị bị xoay.

    - `portrait-primary`
      - : Hiển thị ứng dụng web ở chế độ dọc, thường là khi thiết bị được cầm thẳng đứng.
        Đây thường là hướng ứng dụng mặc định trên các thiết bị có bản chất là dọc.
        Tùy theo thiết bị và triển khai của trình duyệt, ứng dụng thường sẽ giữ nguyên hướng này ngay cả khi thiết bị bị xoay.

    - `portrait-secondary`
      - : Hiển thị ứng dụng web ở chế độ dọc đảo ngược, tức là `portrait-primary` xoay 180 độ.
        Tùy theo thiết bị và triển khai của trình duyệt, ứng dụng thường sẽ giữ nguyên hướng này ngay cả khi thiết bị bị xoay.

    - `landscape`
      - : Hiển thị ứng dụng web với chiều rộng lớn hơn chiều cao.
        Nó cho phép ứng dụng chuyển giữa các hướng `landscape-primary` và `landscape-secondary` khi thiết bị bị xoay.

    - `landscape-primary`
      - : Hiển thị ứng dụng web ở chế độ ngang, thường là khi thiết bị được cầm theo vị trí ngang tiêu chuẩn.
        Đây thường là hướng ứng dụng mặc định trên các thiết bị có bản chất là ngang.
        Tùy theo thiết bị và triển khai của trình duyệt, ứng dụng thường sẽ giữ nguyên hướng này ngay cả khi thiết bị bị xoay.

    - `landscape-secondary`
      - : Hiển thị ứng dụng web ở chế độ ngang đảo ngược, tức là `landscape-primary` xoay 180 độ.
        Tùy theo thiết bị và triển khai của trình duyệt, ứng dụng thường sẽ giữ nguyên hướng này ngay cả khi thiết bị bị xoay.

## Mô tả

Để hiểu member `orientation`, điều quan trọng là phải quen với các khái niệm liên quan đến hướng sau:

- **Hướng thiết bị**: Xác định cách thiết bị được cầm hoặc đặt vật lý.
- **Hướng màn hình**: Xác định hướng vật lý của màn hình thiết bị.
- **Hướng ứng dụng**: Xác định cách nội dung ứng dụng được hiển thị so với hướng màn hình.

Khi thiết bị bị xoay, nó thường làm thay đổi hướng màn hình. Ví dụ, xoay một điện thoại di động từ dọc sang ngang thường chuyển màn hình từ chế độ dọc sang chế độ ngang. Nếu không đặt hướng cụ thể nào trong manifest, hầu hết ứng dụng sẽ điều chỉnh bố cục để phù hợp với hướng màn hình mới này.

Member `orientation` của manifest cho phép bạn kiểm soát cách ứng dụng phản ứng với các thay đổi này. Bằng cách chỉ định một hướng ưu tiên cho ứng dụng, bạn có thể quyết định liệu ứng dụng nên thích ứng với thay đổi hướng màn hình hay giữ bố cục cố định bất kể thiết bị được cầm như thế nào. Ví dụ, bằng cách đặt `"orientation": "portrait-primary"`, bạn có thể chỉ ra rằng bạn muốn ứng dụng của mình luôn được hiển thị ở chế độ dọc thẳng đứng so với màn hình, ngay cả khi thiết bị bị xoay. Trình duyệt hoặc hệ điều hành sẽ cố gắng tôn trọng ưu tiên này khi có thể.

Ví dụ dưới đây minh họa cách bố cục của một ứng dụng web có thể trông như thế nào khi điện thoại di động bị xoay. Với ví dụ này, giả sử rằng giá trị `orientation` của ứng dụng được đặt là `any`, cho phép ứng dụng xoay giữa mọi giá trị `orientation` khi điện thoại bị xoay. Cũng giả sử rằng cả điện thoại và trình duyệt đều hỗ trợ tất cả các hướng. Chuỗi này cho thấy một lần xoay điện thoại theo chiều kim đồng hồ, với mỗi vị trí được xoay từ vị trí ban đầu như sau:

- Góc trên bên trái: `portrait-primary` (vị trí bắt đầu)
- Góc trên bên phải: `landscape-primary` (90 độ)
- Góc dưới bên trái: `portrait-secondary` (180 độ)
- Góc dưới bên phải: `landscape-secondary` (270 độ)

```html hidden
<div class="container">
  <div class="orientation">
    <div class="device portrait-primary">
      <div class="screen">
        <div class="title-bar">Thanh tiêu đề ứng dụng</div>
        <div class="content">Nội dung ứng dụng ở chế độ dọc</div>
      </div>
    </div>
    <div class="label"><code>portrait-primary</code></div>
  </div>
  <div class="orientation">
    <div class="device landscape-primary">
      <div class="screen">
        <div class="title-bar">Thanh tiêu đề ứng dụng</div>
        <div class="content">Nội dung ứng dụng ở chế độ ngang</div>
      </div>
    </div>
    <div class="label"><code>landscape-primary</code></div>
  </div>
  <div class="orientation">
    <div class="device portrait-secondary">
      <div class="screen">
        <div class="title-bar">Thanh tiêu đề ứng dụng</div>
        <div class="content">Nội dung ứng dụng ở chế độ dọc đảo ngược</div>
      </div>
    </div>
    <div class="label"><code>portrait-secondary</code></div>
  </div>
  <div class="orientation">
    <div class="device landscape-secondary">
      <div class="screen">
        <div class="title-bar">Thanh tiêu đề ứng dụng</div>
        <div class="content">Nội dung ứng dụng ở chế độ ngang đảo ngược</div>
      </div>
    </div>
    <div class="label"><code>landscape-secondary</code></div>
  </div>
</div>
```

```css hidden
.container {
  display: grid;
  grid-template-columns: 1fr 1fr;
  grid-gap: 40px;
  padding: 20px;
}

.orientation {
  display: flex;
  flex-direction: column;
  align-items: center;
  text-align: center;
}

.device {
  width: 200px;
  height: 300px;
  border: 5px solid black;
  border-radius: 20px;
  position: relative;
  background-color: white;
  margin-bottom: 10px;
}

.screen {
  width: 180px;
  height: 280px;
  border-radius: 15px;
  background-color: lightgrey;
  margin: 10px;
  overflow: hidden;
  display: flex;
  flex-direction: column;
}

.title-bar {
  background-color: #4285f4;
  color: white;
  padding: 5px;
  text-align: center;
  font-weight: bold;
}

.content {
  flex-grow: 1;
  display: flex;
  justify-content: center;
  align-items: center;
  padding: 10px;
  text-align: center;
}

.landscape-primary,
.landscape-secondary {
  width: 300px;
  height: 200px;
}

.landscape-primary .screen,
.landscape-secondary .screen {
  width: 280px;
  height: 180px;
}

.portrait-secondary {
  transform: rotate(180deg);
}

.landscape-secondary {
  transform: rotate(180deg);
}

.label {
  margin-top: 10px;
  font-family: "Arial", sans-serif;
  font-size: 15px;
}
```

{{EmbedLiveSample('Description', '', 800)}}

### Phạm vi và hành vi mặc định

Hướng `orientation` đã chỉ định được áp dụng cho tất cả {{Glossary("Browsing context", "browsing contexts")}} cấp cao nhất của ứng dụng web.

Nếu trình duyệt hỗ trợ giá trị `orientation` đã chỉ định, nó sẽ dùng giá trị này làm hướng ứng dụng mặc định trong suốt vòng đời của ứng dụng, trừ khi bị ghi đè khi chạy.
Điều này có nghĩa là trình duyệt sẽ quay lại hướng mặc định này bất cứ khi nào browsing context cấp cao nhất được điều hướng.
