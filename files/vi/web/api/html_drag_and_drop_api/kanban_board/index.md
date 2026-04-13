---
title: Bảng Kanban với drag and drop
slug: Web/API/HTML_Drag_and_Drop_API/Kanban_board
page-type: guide
---

{{DefaultAPISidebar("HTML Drag and Drop API")}}

Hướng dẫn này xây dựng một bảng Kanban sử dụng API HTML Drag and Drop. Bảng Kanban cho phép người dùng kéo thẻ nhiệm vụ giữa các cột thể hiện trạng thái khác nhau (ví dụ: "Cần làm", "Đang làm", "Hoàn thành").

## Tổng quan

Bảng Kanban là ứng dụng đặc trưng của việc kéo và thả các phần tử trong một trang web. Trong ví dụ này, người dùng có thể kéo thẻ nhiệm vụ từ cột này sang cột khác.

## Thiết kế cấu trúc HTML

Bảng Kanban bao gồm nhiều cột, mỗi cột chứa các thẻ nhiệm vụ:

```html
<div class="kanban-board">
  <div class="column" id="todo">
    <h2>To Do</h2>
    <div class="card" draggable="true" id="card1">Task 1</div>
    <div class="card" draggable="true" id="card2">Task 2</div>
  </div>
  <div class="column" id="in-progress">
    <h2>In Progress</h2>
    <div class="card" draggable="true" id="card3">Task 3</div>
  </div>
  <div class="column" id="done">
    <h2>Done</h2>
  </div>
</div>
```

## CSS cơ bản

```css
.kanban-board {
  display: flex;
  gap: 1rem;
}

.column {
  flex: 1;
  background: #f4f5f7;
  padding: 1rem;
  border-radius: 4px;
  min-height: 300px;
}

.column.drag-over {
  background: #e2e8f0;
  border: 2px dashed #667eea;
}

.card {
  background: white;
  padding: 0.5rem 1rem;
  margin-bottom: 0.5rem;
  border-radius: 4px;
  box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
  cursor: grab;
}

.card.dragging {
  opacity: 0.5;
}
```

## JavaScript xử lý kéo và thả

```js
// Theo dõi thẻ đang được kéo
let draggedCard = null;

// Thiết lập sự kiện cho tất cả thẻ
document.querySelectorAll(".card").forEach((card) => {
  card.addEventListener("dragstart", (event) => {
    draggedCard = event.target;
    event.target.classList.add("dragging");
    event.dataTransfer.effectAllowed = "move";
    event.dataTransfer.setData("text/plain", event.target.id);
  });

  card.addEventListener("dragend", (event) => {
    event.target.classList.remove("dragging");
    draggedCard = null;
  });
});

// Thiết lập sự kiện cho tất cả cột
document.querySelectorAll(".column").forEach((column) => {
  column.addEventListener("dragover", (event) => {
    event.preventDefault();
    event.dataTransfer.dropEffect = "move";
    column.classList.add("drag-over");
  });

  column.addEventListener("dragleave", (event) => {
    // Chỉ xóa khi rời khỏi cột, không phải khi vào phần tử con
    if (!column.contains(event.relatedTarget)) {
      column.classList.remove("drag-over");
    }
  });

  column.addEventListener("drop", (event) => {
    event.preventDefault();
    column.classList.remove("drag-over");

    if (draggedCard && draggedCard.parentElement !== column) {
      column.appendChild(draggedCard);
    }
  });
});
```

## Chèn vào vị trí đúng

Phiên bản trên thêm thẻ vào cuối cột. Để chèn vào vị trí cụ thể, chúng ta có thể tính toán vị trí dựa trên sự kiện drag:

```js
function getDragAfterElement(column, y) {
  const draggableElements = [
    ...column.querySelectorAll(".card:not(.dragging)"),
  ];

  return draggableElements.reduce(
    (closest, child) => {
      const box = child.getBoundingClientRect();
      const offset = y - box.top - box.height / 2;
      if (offset < 0 && offset > closest.offset) {
        return { offset: offset, element: child };
      } else {
        return closest;
      }
    },
    { offset: Number.NEGATIVE_INFINITY },
  ).element;
}

column.addEventListener("drop", (event) => {
  event.preventDefault();
  column.classList.remove("drag-over");

  const afterElement = getDragAfterElement(column, event.clientY);
  if (afterElement == null) {
    column.appendChild(draggedCard);
  } else {
    column.insertBefore(draggedCard, afterElement);
  }
});
```

## Xem thêm

- [HTML Drag and Drop API](/en-US/docs/Web/API/HTML_Drag_and_Drop_API)
- [Các thao tác kéo](/en-US/docs/Web/API/HTML_Drag_and_Drop_API/Drag_operations)
