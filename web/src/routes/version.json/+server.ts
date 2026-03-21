import { json } from "@sveltejs/kit";
import { getCommit, getBranch, getRemote, getVersion } from "@imput/version-info";

async function safeRead<T>(reader: () => Promise<T>, fallback: T): Promise<T> {
    try {
        return await reader();
    } catch {
        return fallback;
    }
}

export async function GET() {
    return json({
        commit: await safeRead(getCommit, null),
        branch: await safeRead(getBranch, null),
        remote: await safeRead(getRemote, null),
        version: await safeRead(getVersion, "unknown")
    });
}

export const prerender = true;
