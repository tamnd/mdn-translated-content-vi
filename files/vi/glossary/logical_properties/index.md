---
title: Logical properties
slug: Glossary/Logical_properties
page-type: glossary-definition
sidebar: glossarysidebar
---

**Thuộc tính logic** (Logical properties) trong CSS cung cấp cách sắp xếp nội dung dựa trên chế độ viết và hướng của tài liệu thay vì các chiều vật lý của viewport. Điều này cho phép thiết kế linh hoạt và dễ bảo trì hơn, đặc biệt cho các trang web hỗ trợ nhiều ngôn ngữ.

Trong khi {{glossary("physical properties","thuộc tính vật lý")}} như {{cssxref("top")}}, {{cssxref("right")}}, {{cssxref("padding-bottom")}}, và {{cssxref("border-bottom-left-radius")}} xác định vị trí và các tính năng dựa trên hướng vật lý và tham chiếu đến các cạnh cụ thể của phần tử, thì các thuộc tính logic như {{cssxref("inset-block-start")}}, {{cssxref("inset-inline-end")}}, {{cssxref("padding-block-end")}}, và {{cssxref("border-end-end-radius")}} sử dụng các từ khóa hướng logic tương đối với chiều luồng của nội dung dọc theo trục block và trục inline.

## Hướng block

**Trục block** là trục xác định thứ tự xếp chồng của các phần tử trong bố cục block. Về cơ bản đây là hướng mà các khối nội dung — như đoạn văn ({{htmlelement("p")}}), tiêu đề, và div ({{htmlelement("div")}}) — được sắp xếp trên trang web. Đây còn được gọi là **hướng block**. Trong các ngôn ngữ viết từ trái sang phải, hướng block là chiều dọc của luồng nội dung, từ trên xuống dưới.

**Block-start** và **block-end** đại diện cho _cạnh đầu_ và _cạnh cuối_ của nội dung dọc theo trục block, với `block-start` tương đương với `top` và `block-end` tương đương với `bottom` trong chế độ viết ngang.

## Hướng inline

**Trục inline** vuông góc với trục block. Trục inline đại diện cho hướng mà nội dung inline như văn bản chảy trong một block. Đây còn được gọi là **hướng inline**. Trong chế độ viết từ trái sang phải, như tiếng Anh, hướng inline là ngang, từ trái sang phải. Trong các ngôn ngữ từ phải sang trái, như tiếng Ả-rập và tiếng Hebrew, hướng inline là ngang, từ phải sang trái.

**Inline-start** và **inline-end** đại diện cho _cạnh đầu_ và _cạnh cuối_ của nội dung dọc theo trục inline, với `inline-start` và `inline-end` tương đương với `left` và `right` trong chế độ viết ngang. `inline-start` là `left` trong ngôn ngữ từ trái sang phải và `right` trong ngôn ngữ từ phải sang trái.

## Xem thêm

- Module [CSS logical properties and values](/en-US/docs/Web/CSS/Guides/Logical_properties_and_values)
