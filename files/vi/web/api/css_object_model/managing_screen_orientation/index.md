---
title: Quản lý hướng màn hình
slug: Web/API/CSS_Object_Model/Managing_screen_orientation
page-type: guide
---

{{DefaultAPISidebar("Screen Orientation API")}}

Thuật ngữ _hướng màn hình_ dùng để chỉ việc một [viewport](/en-US/docs/Glossary/Viewport) của trình duyệt đang ở chế độ ngang (tức là chiều rộng của viewport lớn hơn chiều cao), hay đang ở chế độ dọc (chiều cao của viewport lớn hơn chiều rộng)

CSS cung cấp đặc tính media {{cssxref("@media/orientation")}} để cho phép điều chỉnh bố cục dựa trên hướng màn hình.

[Screen Orientation API](/en-US/docs/Web/API/Screen_Orientation_API) cung cấp một API JavaScript có thể lập trình để làm việc với hướng màn hình - bao gồm khả năng khóa viewport vào một hướng cụ thể.

## Điều chỉnh bố cục dựa trên hướng

Một trong những trường hợp phổ biến nhất khi hướng thay đổi là khi bạn muốn sửa lại bố cục nội dung dựa trên hướng của thiết bị. Ví dụ, có thể bạn muốn một thanh nút kéo dài theo chiều dài lớn nhất của màn hình thiết bị. Bằng cách dùng truy vấn media, bạn có thể làm điều đó dễ dàng và tự động.

Hãy xem ví dụ sau với mã HTML

```html
<ul id="toolbar">
  <li>A</li>
  <li>B</li>
  <li>C</li>
</ul>

<p>
  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis lacinia nisi nec
  sem viverra vitae fringilla nulla ultricies. In ac est dolor, quis tincidunt
  leo. Cras commodo quam non tortor consectetur eget rutrum dolor ultricies. Ut
  interdum tristique dapibus. Nullam quis malesuada est.
</p>
```

CSS dựa vào truy vấn media orientation để xử lý các kiểu cụ thể theo hướng màn hình

```css
/* Trước tiên hãy định nghĩa một số kiểu dùng chung */

html,
body {
  width: 100%;
  height: 100%;
}

body {
  border: 1px solid black;

  -moz-box-sizing: border-box;
  box-sizing: border-box;
}

p {
  font: 1em sans-serif;
  margin: 0;
  padding: 0.5em;
}

ul {
  list-style: none;

  font: 1em monospace;
  margin: 0;
  padding: 0.5em;

  -moz-box-sizing: border-box;
  box-sizing: border-box;

  background: black;
}

li {
  display: inline-block;
  margin: 0;
  padding: 0.5em;
  background: white;
}
```

Khi đã có một số kiểu dùng chung, ta có thể bắt đầu định nghĩa trường hợp riêng cho từng hướng

```css
/* Với chế độ dọc, ta muốn thanh công cụ ở phía trên */

@media screen and (orientation: portrait) {
  #toolbar {
    width: 100%;
  }
}

/* Với chế độ ngang, ta muốn thanh công cụ bám bên trái */

@media screen and (orientation: landscape) {
  #toolbar {
    position: fixed;
    width: 2.65em;
    height: 100%;
  }

  p {
    margin-left: 2em;
  }

  li + li {
    margin-top: 0.5em;
  }
}
```

Và đây là kết quả

<table class="no-markdown">
  <thead>
    <tr>
      <th scope="col">Portrait</th>
      <th scope="col">Landscape</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <div>
          {{ EmbedLiveSample('Adjusting_layout_based_on_the_orientation', 180, 350) }}
        </div>
      </td>
      <td>
        <div>
          {{ EmbedLiveSample('Adjusting_layout_based_on_the_orientation', 350, 180) }}
        </div>
      </td>
    </tr>
  </tbody>
</table>

> [!NOTE]
> Truy vấn media orientation thực ra được áp dụng dựa trên hướng của cửa sổ trình duyệt (hoặc iframe), chứ không phải hướng của thiết bị.

## Khóa hướng màn hình

Một số thiết bị (chủ yếu là thiết bị di động) có thể tự động thay đổi hướng màn hình dựa trên hướng vật lý của chúng, đảm bảo người dùng luôn có thể đọc nội dung trên màn hình. Dù hành vi này rất phù hợp với nội dung văn bản, có một số nội dung có thể bị ảnh hưởng xấu bởi thay đổi như vậy. Ví dụ, trò chơi phụ thuộc vào hướng thiết bị có thể bị lỗi nếu hướng thay đổi.

Screen Orientation API được tạo ra để ngăn chặn hoặc xử lý sự thay đổi đó.

### Lắng nghe thay đổi hướng

Mỗi khi hướng màn hình thay đổi, sự kiện {{domxref("ScreenOrientation.change_event", "change")}} của giao diện {{domxref("ScreenOrientation")}} sẽ được kích hoạt:

```js
screen.orientation.addEventListener("change", () => {
  console.log(`The orientation of the screen is: ${screen.orientation}`);
});
```

### Ngăn thay đổi hướng

Bất kỳ ứng dụng web nào cũng có thể khóa màn hình theo nhu cầu riêng. Màn hình được khóa bằng phương thức {{domxref("ScreenOrientation.lock()", "screen.orientation.lock()")}} và được mở khóa bằng phương thức {{domxref("ScreenOrientation.unlock()", "screen.orientation.unlock()")}}.

Phương thức {{domxref("ScreenOrientation.lock()", "screen.orientation.lock()")}} chấp nhận một trong các giá trị sau để xác định kiểu khóa cần áp dụng: `any`, `natural`. `portrait-primary`, `portrait-secondary`, `landscape-primary`, `landscape-secondary`, `portrait`, và `landscape`:

```js
screen.orientation.lock();
```

Nó trả về một [promise](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise) được giải quyết sau khi khóa thành công.

> [!NOTE]
> Việc khóa màn hình phụ thuộc vào từng ứng dụng web. Nếu ứng dụng A bị khóa ở `landscape` và ứng dụng B bị khóa ở `portrait`, việc chuyển từ ứng dụng A sang B hoặc ngược lại sẽ không kích hoạt sự kiện `change` trên `ScreenOrientation` vì cả hai ứng dụng sẽ giữ nguyên hướng mà chúng đang có.
>
> Tuy nhiên, việc khóa hướng có thể kích hoạt sự kiện `change` nếu hướng cần phải được thay đổi để đáp ứng yêu cầu khóa.

## Xem thêm

- {{domxref("Screen.orientation", "screen.orientation")}}
- {{domxref("ScreenOrientation")}}
- Sự kiện {{DOMxRef("ScreenOrientation.change_event", "change")}} của {{domxref("ScreenOrientation")}}
- {{cssxref("@media/orientation")}}
