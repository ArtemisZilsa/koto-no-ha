import { createClient } from '@/lib/supabase/server'
import { NavClient } from './NavClient'

export async function Nav() {
  const supabase = await createClient()
  const {
    data: { user },
  } = await supabase.auth.getUser()

  return <NavClient user={user} />
}
