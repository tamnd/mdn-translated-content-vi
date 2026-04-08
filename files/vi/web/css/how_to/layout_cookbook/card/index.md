---
title: Card
slug: Web/CSS/How_to/Layout_cookbook/Card
page-type: how-to
sidebar: cssref
---

Mẫu này là danh sách các thành phần "card" với footer tùy chọn. Một card chứa tiêu đề, hình ảnh, mô tả hoặc nội dung khác, và thông tin ghi nhận tác giả hoặc footer. Các card thường được hiển thị trong một nhóm hoặc bộ sưu tập.

![Ba thành phần card trong một hàng](cards.png)

## Yêu cầu

Tạo một nhóm các card, trong đó mỗi thành phần card chứa tiêu đề, hình ảnh, nội dung và tùy chọn là footer.

Mỗi card trong nhóm các card phải có cùng chiều cao. Footer card tùy chọn phải cố định ở dưới cùng của card.

Các card trong nhóm phải được căn chỉnh theo hai chiều — cả chiều dọc lẫn chiều ngang.

## Công thức

Nhấp vào "Play" trong các khối code bên dưới để chỉnh sửa ví dụ trong MDN Playground:

```html live-sample___card-example
<div class="cards">
  <article class="card">
    <header>
      <h2>A short heading</h2>
    </header>

    <img
      src="https://mdn.github.io/shared-assets/images/examples/balloons.jpg"
      alt="Hot air balloons" />
    <div class="content">
      <p>
        The idea of reaching the North Pole by means of balloons appears to have
        been entertained many years ago.
      </p>
    </div>
  </article>

  <article class="card">
    <header>
      <h2>A short heading</h2>
    </header>

    <img
      src="https://mdn.github.io/shared-assets/images/examples/balloons2.jpg"
      alt="Hot air balloons" />
    <div class="content">
      <p>Short content.</p>
    </div>
    <footer>I have a footer!</footer>
  </article>

  <article class="card">
    <header>
      <h2>A longer heading in this card</h2>
    </header>

    <img
      src="https://mdn.github.io/shared-assets/images/examples/balloons.jpg"
      alt="Hot air balloons" />
    <div class="content">
      <p>
        In a curious work, published in Paris in 1863 by Delaville Dedreux,
        there is a suggestion for reaching the North Pole by an aerostat.
      </p>
    </div>
    <footer>I have a footer!</footer>
  </article>
  <article class="card">
    <header>
      <h2>A short heading</h2>
    </header>

    <img
      src="https://mdn.github.io/shared-assets/images/examples/balloons2.jpg"
      alt="Hot air balloons" />
    <div class="content">
      <p>
        The idea of reaching the North Pole by means of balloons appears to have
        been entertained many years ago.
      </p>
    </div>
  </article>
</div>
```

```css live-sample___card-example
body {
  font: 1.2em sans-serif;
}

img {
  max-width: 100%;
}

.cards {
  max-width: 700px;
  margin: 1em auto;

  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(230px, 1fr));
  grid-gap: 20px;
}

.card {
  border: 1px solid #999999;
  border-radius: 3px;

  display: grid;
  grid-template-rows: max-content 200px 1fr;
}

.card img {
  object-fit: cover;
  width: 100%;
  height: 100%;
}

.card h2 {
  margin: 0;
  padding: 0.5rem;
}

.card .content {
  padding: 0.5rem;
}

.card footer {
  background-color: #333333;
  color: white;
  padding: 0.5rem;
}
```

{{EmbedLiveSample("card-example", "", "950px")}}

## Các lựa chọn được thực hiện

Mỗi card được bố cục bằng cách sử dụng [CSS grid layout](/en-US/docs/Web/CSS/Guides/Grid_layout) mặc dù bố cục là một chiều. Điều này cho phép sử dụng kích thước nội dung cho các track grid. Để thiết lập grid một cột, chúng ta có thể sử dụng như sau:

```css
.card {
  display: grid;
  grid-template-rows: max-content 200px 1fr;
}
```

{{cssxref("display", "display: grid")}} chuyển đổi phần tử thành grid container. Ba giá trị của thuộc tính {{cssxref("grid-template-rows")}} chia grid thành tối thiểu ba hàng, xác định chiều cao của ba phần tử con đầu tiên của card, theo thứ tự.

Mỗi `card` chứa {{HTMLElement("header")}}, {{HTMLElement("img")}} và {{HTMLElement("div")}}, theo thứ tự đó, với một số card cũng chứa {{HTMLElement("footer")}}.

Hàng tiêu đề, hay track, được đặt thành {{cssxref("max-content")}}, ngăn nó giãn ra. Track hình ảnh được đặt cao 200 pixel. Track thứ ba, nơi chứa nội dung, được đặt thành `1fr`. Điều này có nghĩa là nó sẽ lấp đầy bất kỳ khoảng trống nào còn lại.

Bất kỳ phần tử con nào ngoài ba phần tử có kích thước được xác định rõ ràng sẽ tạo ra các hàng trong implicit grid, phù hợp với nội dung được thêm vào. Chúng được tự động định kích thước theo mặc định. Nếu một card có footer, nó sẽ được tự động định kích thước. Footer, khi có, cố định ở dưới cùng của grid. Footer được tự động định kích thước để vừa với nội dung của nó; `<div>` nội dung sau đó kéo dài để chiếm bất kỳ khoảng trống nào còn lại.

Tập hợp quy tắc sau tạo ra lưới các card:

```css
.cards {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(230px, 1fr));
  gap: 20px;
}
```

Thuộc tính {{cssxref("grid-template-columns")}} xác định chiều rộng của các cột grid. Trong trường hợp này, chúng ta đặt grid để tự động lấp đầy, với các cột lặp lại có chiều rộng tối thiểu là `230px` nhưng được phép tăng lên để lấp đầy không gian có sẵn. Thuộc tính {{cssxref("gap")}} đặt khoảng cách `20px` giữa các hàng và cột liền kề.

> [!NOTE]
> Các phần tử khác nhau trong các card riêng biệt không căn chỉnh với nhau, vì mỗi card là một grid độc lập. Việc căn chỉnh các thành phần trong mỗi card với các thành phần tương ứng trong các card liền kề có thể được thực hiện với [subgrid](/en-US/docs/Web/CSS/Guides/Grid_layout/Subgrid).

## Các phương pháp thay thế

[Flexbox](/en-US/docs/Web/CSS/Guides/Flexible_box_layout) cũng có thể được dùng để bố cục mỗi card. Với flexbox, kích thước của các hàng trong mỗi card được đặt bằng thuộc tính {{cssxref("flex")}} trên mỗi hàng, thay vì trên card container.

Với flexbox, kích thước của các flex item được xác định trên các phần tử con thay vì trên phần tử cha. Việc bạn chọn dùng grid hay flexbox phụ thuộc vào sở thích của bạn, cho dù bạn thích kiểm soát các track từ container hay thích thêm quy tắc cho các mục.

Chúng tôi chọn grid cho các card vì, nói chung, bạn muốn các card được căn chỉnh theo cả chiều dọc lẫn chiều ngang. Ngoài ra, việc căn chỉnh các thành phần trong mỗi card với các thành phần của các card liền kề có thể được thực hiện với subgrid. Flex không có giải pháp tương đương không cần hack cho subgrid.

## Vấn đề về khả năng tiếp cận

Tùy thuộc vào nội dung của card, có thể có những điều bạn có thể hoặc nên làm để cải thiện khả năng tiếp cận. Xem [Inclusive components: Card](https://inclusive-components.design/cards/) của Heydon Pickering để có giải thích chi tiết về các vấn đề này.

## Xem thêm

- {{Cssxref("grid-template-columns")}}
- {{Cssxref("grid-template-rows")}}
- {{Cssxref("gap")}}
- [Inclusive components: Card](https://inclusive-components.design/cards/)
- Mô-đun [CSS grid layout](/en-US/docs/Web/CSS/Guides/Grid_layout)
