---
title: Media objects
slug: Web/CSS/How_to/Layout_cookbook/Media_objects
page-type: how-to
sidebar: cssref
---

_Media Object_ (đối tượng phương tiện) là một mẫu chúng ta thấy khắp nơi trên web. Nó đề cập đến một hộp hai cột với một hình ảnh ở một bên và văn bản mô tả ở phía kia, ví dụ như một bài đăng trên mạng xã hội.

![Ví dụ về media object với ảnh hồ sơ ở bên trái và văn bản lorem ipsum bên phải chiếm 80% không gian](media-object.png)

## Yêu cầu

Mẫu Media Object cần một số hoặc tất cả các đặc điểm sau:

- Xếp chồng trên mobile, hai cột trên Desktop.
- Hình ảnh có thể ở bên trái hoặc bên phải.
- Hình ảnh có thể nhỏ hoặc lớn.
- Media Object có thể được lồng nhau.
- Media Object nên xóa nội dung bất kể bên nào cao hơn.

## Công thức

Nhấn "Play" trong các khối mã dưới đây để chỉnh sửa ví dụ trong MDN Playground:

```html live-sample___media-objects-example
<div class="media">
  <div class="img">
    <img
      src="https://mdn.github.io/shared-assets/images/examples/balloons_square.jpg"
      alt="Balloons" />
  </div>

  <div class="content">
    <p>
      Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis vehicula
      vitae ligula sit amet maximus. Nunc auctor neque ipsum, ac porttitor elit
      lobortis ac. Vivamus ultrices sodales tellus et aliquam. Pellentesque
      porta sit amet nulla vitae luctus. Praesent quis risus id dolor venenatis
      condimentum.
    </p>
  </div>
  <div class="footer">An optional footer goes here.</div>
</div>

<div class="media">
  <div class="img">
    <img
      src="https://mdn.github.io/shared-assets/images/examples/sharp-account_box-24px.svg"
      width="80px"
      alt="Account" />
  </div>
  <div class="content">
    <p>
      Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis vehicula
      vitae ligula sit amet maximus. Nunc auctor neque ipsum, ac porttitor elit
      lobortis ac. Vivamus ultrices sodales tellus et aliquam. Pellentesque
      porta sit amet nulla vitae luctus. Praesent quis risus id dolor venenatis
      condimentum.
    </p>
  </div>
  <div class="footer"></div>
</div>
```

```html hidden live-sample___media-objects-example
<div class="media media-flip">
  <div class="img">
    <img
      src="https://mdn.github.io/shared-assets/images/examples/balloons_square.jpg"
      alt="Balloons" />
  </div>

  <div class="content">
    <p>
      Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis vehicula
      vitae ligula sit amet maximus. Nunc auctor neque ipsum, ac porttitor elit
      lobortis ac. Vivamus ultrices sodales tellus et aliquam. Pellentesque
      porta sit amet nulla vitae luctus. Praesent quis risus id dolor venenatis
      condimentum.
    </p>
  </div>
  <div class="footer">An optional footer goes here.</div>
</div>

<div class="media">
  <a class="img">
    <img
      src="https://mdn.github.io/shared-assets/images/examples/balloons_square.jpg"
      alt="Balloons" />
  </a>

  <div class="content">
    <p>
      Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis vehicula
      vitae ligula sit amet maximus. Nunc auctor neque ipsum, ac porttitor elit
      lobortis ac. Vivamus ultrices sodales tellus et aliquam. Pellentesque
      porta sit amet nulla vitae luctus. Praesent quis risus id dolor venenatis
      condimentum.
    </p>
  </div>

  <div class="footer"></div>

  <div class="media">
    <a class="img">
      <img
        src="https://mdn.github.io/shared-assets/images/examples/balloons_square.jpg"
        alt="Balloons" />
    </a>

    <div class="content">
      <p>
        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis vehicula
        vitae ligula sit amet maximus.
      </p>
    </div>

    <div class="footer"></div>
  </div>
</div>
```

```css live-sample___media-objects-example
body {
  font: 1.2em sans-serif;
}

img {
  max-width: 100%;
}

p {
  margin: 0 0 1em 0;
}

@media (width >= 500px) {
  .media {
    display: grid;
    grid-template-columns: fit-content(200px) 1fr;
    grid-template-rows: 1fr auto;
    grid-template-areas:
      "image content"
      "image footer";
    grid-gap: 20px;
    margin-bottom: 4em;
  }

  .media-flip {
    grid-template-columns: 1fr fit-content(250px);
    grid-template-areas:
      "content image"
      "footer image";
  }

  .img {
    grid-area: image;
  }

  .content {
    grid-area: content;
  }

  .footer {
    grid-area: footer;
  }
}
```

{{EmbedLiveSample("media-objects-example", "", "1500px")}}

## Các lựa chọn được thực hiện

Tôi đã chọn sử dụng [grid layout](/en-US/docs/Web/CSS/Guides/Grid_layout) cho media object vì nó cho phép tôi kiểm soát bố cục theo hai chiều khi cần. Điều này có nghĩa là khi chúng ta có footer, với nội dung ngắn ở trên, footer có thể được đẩy xuống dưới cùng của media object.

Một lý do khác để sử dụng grid layout là để tôi có thể sử dụng {{cssxref("fit-content")}} cho kích thước track của hình ảnh. Bằng cách sử dụng `fit-content` với kích thước tối đa 200 pixel, khi chúng ta có một hình ảnh nhỏ như biểu tượng, track chỉ lớn bằng kích thước của hình ảnh đó - kích thước `max-content`. Nếu hình ảnh lớn hơn, track ngừng tăng trưởng ở 200 pixel và vì hình ảnh có {{cssxref("max-width")}} là 100% được áp dụng, nó thu nhỏ để tiếp tục phù hợp với cột.

Bằng cách sử dụng {{cssxref("grid-template-areas")}} để thực hiện bố cục, tôi có thể thấy mẫu trong CSS. Tôi định nghĩa lưới của mình khi viewport rộng 500 pixel, vì vậy trên các thiết bị nhỏ hơn, media object xếp chồng.

Một tùy chọn cho mẫu này là lật nó để chuyển hình ảnh sang phía bên kia - điều này được thực hiện bằng cách thêm class `media-flip`, định nghĩa một template lưới bị lật gây ra bố cục được phản chiếu.

Khi chúng ta lồng một media object bên trong một cái khác, chúng ta cần đặt nó vào track thứ hai trong bố cục thông thường, và track đầu tiên khi bị lật.

## Xem thêm

- Thuộc tính {{cssxref("fit-content")}}
- [Sử dụng grid template areas](/en-US/docs/Web/CSS/Guides/Grid_layout/Grid_template_areas)
- Module [CSS grid layout](/en-US/docs/Web/CSS/Guides/Grid_layout)
