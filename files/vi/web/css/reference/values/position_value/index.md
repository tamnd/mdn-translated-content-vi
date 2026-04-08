---
title: <position>
slug: Web/CSS/Reference/Values/position_value
page-type: css-type
browser-compat: css.types.position
sidebar: cssref
---

Kiểu dữ liệu **`<position>`** trong [CSS](/vi/docs/Web/CSS) biểu thị một tọa độ hai chiều dùng để đặt vị trí tương đối so với hộp phần tử. Nó được sử dụng trong các thuộc tính {{cssxref("background-position")}}, {{cssxref("object-position")}}, {{cssxref("mask-position")}}, {{cssxref("offset-position")}}, {{cssxref("offset-anchor")}} và {{cssxref("transform-origin")}}.

> [!NOTE]
> Vị trí cuối cùng được mô tả bởi giá trị `<position>` không nhất thiết phải nằm bên trong hộp phần tử.

## Cú pháp

![Lưới hiển thị cách đặt các giá trị khác nhau. 0 0 là góc trên bên trái. Bốn giá trị, right, right center, center left 100%, và top 50% left 100%, đều tương đương nhau, nằm ở cạnh phải ở giữa theo chiều dọc. Hai giá trị, top 75px left 100px và left 100px top 75px, là như nhau. Bottom left 25% giống với top 100% left 25%.](position_type.png)

Kiểu dữ liệu `<position>` được xác định bằng một hoặc hai từ khóa, với offset tùy chọn.

Các giá trị từ khóa là `center`, `top`, `right`, `bottom` và `left`. Mỗi từ khóa đại diện cho một cạnh của hộp phần tử hoặc đường trung tâm giữa hai cạnh. Tùy thuộc vào ngữ cảnh, `center` đại diện cho trung tâm giữa cạnh trái và phải, hoặc trung tâm giữa cạnh trên và dưới.

Nếu được chỉ định, một offset có thể là giá trị {{cssxref("&lt;percentage&gt;")}} tương đối hoặc giá trị {{cssxref("&lt;length&gt;")}} tuyệt đối. Giá trị dương được offset về phía phải hoặc phía dưới, tùy theo ngữ cảnh. Giá trị âm được offset theo hướng ngược lại.

Nếu chỉ một giá trị offset được chỉ định, nó xác định tọa độ x, với giá trị cho trục kia mặc định là `center`.

```css
/* Cú pháp 1 giá trị */
keyword                  /* Vị trí ngang hoặc dọc; trục kia mặc định là center */
value                    /* Vị trí trên trục x; trục y mặc định là 50% */

/* Cú pháp 2 giá trị */
keyword keyword          /* Một từ khóa cho mỗi chiều (thứ tự không quan trọng) */
keyword value            /* Một từ khóa cho vị trí ngang, giá trị cho vị trí dọc */
value keyword            /* Một giá trị cho vị trí ngang, từ khóa cho vị trí dọc */
value value              /* Một giá trị cho mỗi chiều (ngang rồi dọc) */

/* Cú pháp 4 giá trị */
keyword value keyword value /* Mỗi giá trị là offset từ từ khóa đứng trước nó */
```

> [!NOTE]
> Thuộc tính {{cssxref("background-position")}} cũng chấp nhận cú pháp ba giá trị. Điều này không được phép trong các thuộc tính khác sử dụng `<position>`.

## Nội suy

Khi được hoạt ảnh, hoành độ và tung độ của một điểm được nội suy độc lập. Tuy nhiên, vì tốc độ nội suy được xác định bởi một [hàm easing](/vi/docs/Web/CSS/Reference/Values/easing-function) duy nhất cho cả hai tọa độ, điểm sẽ di chuyển theo đường thẳng.

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Vị trí hợp lệ

```plain example-good
center
left
center top

right 8.5%
bottom 12vmin right -6px

10% 20%
8rem 14px
```

### Vị trí không hợp lệ

```plain example-bad
left right
bottom top
10px 15px 20px 15px
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Mô-đun [CSS values and units](/vi/docs/Web/CSS/Guides/Values_and_units)
- [Học: Giá trị và đơn vị CSS](/vi/docs/Learn_web_development/Core/Styling_basics/Values_and_units)
- {{cssxref("background-position")}}
- {{cssxref("gradient/radial-gradient", "radial-gradient()")}}
- {{cssxref("gradient/conic-gradient", "conic-gradient()")}}
