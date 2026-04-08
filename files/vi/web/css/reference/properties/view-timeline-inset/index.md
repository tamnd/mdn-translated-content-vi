---
title: view-timeline-inset
slug: Web/CSS/Reference/Properties/view-timeline-inset
page-type: css-property
browser-compat: css.properties.view-timeline-inset
sidebar: cssref
---

Thuộc tính **`view-timeline-inset`** của [CSS](/vi/docs/Web/CSS) được dùng để chỉ định một hoặc hai giá trị đại diện cho điều chỉnh vị trí của scrollport (xem {{glossary("Scroll container")}} để biết thêm chi tiết) mà trong đó phần tử subject của hoạt ảnh _tiến trình xem được đặt tên_ được coi là hiển thị. Nói cách khác, thuộc tính này cho phép bạn chỉ định các giá trị inset (hoặc outset) bắt đầu và/hoặc kết thúc để bù đắp vị trí của tiến trình đồng hồ.

Thuộc tính này có thể kết hợp với hoặc dùng thay thế cho {{cssxref("animation-range")}} và các thuộc tính dài của nó, có thể được dùng để đặt phạm vi gắn kết của hoạt ảnh theo tiến trình đồng hồ.
Xem [Hoạt ảnh cuộn CSS](/vi/docs/Web/CSS/Guides/Scroll-driven_animations) để biết thêm chi tiết.

> [!NOTE]
> Nếu phần tử scroller không tràn vùng chứa theo chiều của trục hoặc nếu phần tràn bị ẩn hoặc bị cắt, sẽ không tạo ra tiến trình cuộn nào.

Các thuộc tính `view-timeline-inset`, {{cssxref("view-timeline-axis")}} và {{cssxref("view-timeline-name")}} cũng có thể được đặt bằng thuộc tính viết tắt {{cssxref("view-timeline")}}.

## Cú pháp

```css
/* Một giá trị */
view-timeline-inset: auto;
view-timeline-inset: 200px;
view-timeline-inset: 20%;

/* Hai giá trị */
view-timeline-inset: 20% auto;
view-timeline-inset: auto 200px;
view-timeline-inset: 20% 200px;
```

### Giá trị

Các giá trị được chấp nhận cho `view-timeline-inset`:

- `auto`
  - : Nếu được đặt, giá trị {{cssxref("scroll-padding")}} tương ứng (hoặc giá trị dài tương đương) cho cạnh đó của scrollport sẽ được dùng. Nếu giá trị này không được đặt (hoặc được đặt thành `auto`), giá trị thường sẽ là 0, mặc dù một số tác nhân người dùng có thể dùng heuristics để xác định giá trị mặc định khác nếu thích hợp.
- {{cssxref("length-percentage")}}
  - : Bất kỳ giá trị `<length-percentage>` hợp lệ nào đều được chấp nhận làm giá trị inset/outset.
    - Nếu giá trị là dương, vị trí bắt đầu/kết thúc của hoạt ảnh sẽ được di chuyển vào bên trong scrollport một khoảng bằng độ dài hoặc phần trăm đã chỉ định.
    - Nếu giá trị là âm, vị trí bắt đầu/kết thúc của hoạt ảnh sẽ được di chuyển ra ngoài scrollport một khoảng bằng độ dài hoặc phần trăm đã chỉ định, tức là nó sẽ bắt đầu hoạt ảnh trước khi xuất hiện trong scrollport, hoặc kết thúc hoạt ảnh sau khi rời khỏi scrollport.

Nếu hai giá trị được cung cấp, giá trị đầu tiên đại diện cho inset/outset bắt đầu theo trục liên quan (nơi hoạt ảnh bắt đầu) và giá trị thứ hai đại diện cho inset/outset kết thúc (nơi hoạt ảnh kết thúc). Nếu chỉ có một giá trị được cung cấp, cả inset/outset bắt đầu và kết thúc đều được đặt thành cùng giá trị.

## Định nghĩa chính thức

{{cssinfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Tạo tiến trình xem được đặt tên với inset

Tiến trình xem được đặt tên `--subject-reveal` được xác định bằng thuộc tính `view-timeline` trên phần tử subject có `class` là `animation`.
Tiến trình này sau đó được đặt làm tiến trình đồng hồ cho cùng phần tử đó bằng `animation-timeline: --subject-reveal;`. Kết quả là phần tử subject được hoạt ảnh hóa khi nó di chuyển lên trên trong tài liệu khi trang được cuộn.

Khai báo `view-timeline-inset` cũng được đặt để làm cho hoạt ảnh bắt đầu muộn hơn dự kiến và kết thúc sớm hơn.

#### HTML

HTML cho ví dụ được hiển thị bên dưới.

```html
<div class="content">
  <h1>Content</h1>

  <p>
    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
    tempor incididunt ut labore et dolore magna aliqua. Risus quis varius quam
    quisque id. Et ligula ullamcorper malesuada proin libero nunc consequat
    interdum varius. Elit ullamcorper dignissim cras tincidunt lobortis feugiat
    vivamus at augue.
  </p>

  <p>
    Dolor sed viverra ipsum nunc aliquet. Sed sed risus pretium quam vulputate
    dignissim. Tortor aliquam nulla facilisi cras. A erat nam at lectus urna
    duis convallis convallis. Nibh ipsum consequat nisl vel pretium lectus.
    Sagittis aliquam malesuada bibendum arcu vitae elementum. Malesuada bibendum
    arcu vitae elementum curabitur vitae nunc sed velit.
  </p>

  <div class="subject animation"></div>

  <p>
    Adipiscing enim eu turpis egestas pretium aenean pharetra magna ac. Arcu
    cursus vitae congue mauris rhoncus aenean vel. Sit amet cursus sit amet
    dictum. Augue neque gravida in fermentum et. Gravida rutrum quisque non
    tellus orci ac auctor augue mauris. Risus quis varius quam quisque id diam
    vel quam elementum. Nibh praesent tristique magna sit amet purus gravida
    quis. Duis ultricies lacus sed turpis tincidunt id aliquet. In egestas erat
    imperdiet sed euismod nisi. Eget egestas purus viverra accumsan in nisl nisi
    scelerisque. Netus et malesuada fames ac.
  </p>
</div>
```

#### CSS

Phần tử `subject` và phần tử `content` chứa nó được tạo kiểu tối giản, và nội dung văn bản được cài đặt phông chữ cơ bản:

```css
.subject {
  width: 300px;
  height: 200px;
  margin: 0 auto;
  background-color: deeppink;
}

.content {
  width: 75%;
  max-width: 800px;
  margin: 0 auto;
}

p,
h1 {
  font-family: "Helvetica", "Arial", sans-serif;
}

h1 {
  font-size: 3rem;
}

p {
  font-size: 1.5rem;
  line-height: 1.5;
}
```

Phần tử `<div>` có class `subject` cũng được cho class `animation` — đây là nơi `view-timeline` được đặt để xác định tiến trình xem được đặt tên. Chúng ta cũng cho nó khai báo `view-timeline-inset` để làm cho hoạt ảnh bắt đầu muộn hơn dự kiến và kết thúc sớm hơn. Nó cũng được cho tên `animation-timeline` với cùng giá trị để khai báo đây sẽ là phần tử được hoạt ảnh hóa khi tiến trình xem tiến triển.

Cuối cùng, một hoạt ảnh được chỉ định trên phần tử hoạt ảnh hóa độ mờ và tỷ lệ của nó, khiến nó mờ dần và lớn dần khi di chuyển lên scroller.

```css
.animation {
  view-timeline: --subject-reveal block;
  view-timeline-inset: 70% -100px;
  animation-timeline: --subject-reveal;

  animation-name: appear;
  animation-fill-mode: both;
  animation-duration: 1ms; /* Firefox yêu cầu điều này để áp dụng hoạt ảnh */
}

@keyframes appear {
  from {
    opacity: 0;
    transform: scaleX(0);
  }

  to {
    opacity: 1;
    transform: scaleX(1);
  }
}
```

#### Kết quả

Cuộn trang để xem phần tử subject được hoạt ảnh hóa.

{{EmbedLiveSample("Creating a named view progress timeline with inset", "100%", "480px")}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("animation-timeline")}}
- {{cssxref("timeline-scope")}}
- {{cssxref("view-timeline")}}, {{cssxref("view-timeline-axis")}}, {{cssxref("view-timeline-name")}}
- [Hoạt ảnh cuộn CSS](/vi/docs/Web/CSS/Guides/Scroll-driven_animations)
