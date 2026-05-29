type Props = { title: string; status: "todo" | "doing" | "done" };

export function TaskCard({ title, status }: Props) {
  return <article data-status={status}>{title}</article>;
}
