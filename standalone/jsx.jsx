export function TaskCard({ title, status }) {
  return <article data-status={status}>{title}</article>;
}
