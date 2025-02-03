import { Clarinet, Tx, Chain, Account, types } from 'https://deno.land/x/clarinet@v1.0.0/index.ts';
import { assertEquals } from 'https://deno.land/std@0.90.0/testing/asserts.ts';

Clarinet.test({
  name: "Ensure session validation works",
  async fn(chain: Chain, accounts: Map<string, Account>) {
    const wallet1 = accounts.get('wallet_1')!;
    
    // Test valid duration
    let block = chain.mineBlock([
      Tx.contractCall('zen-session', 'start-session', 
        [types.uint(30)], 
        wallet1.address)
    ]);
    assertEquals(block.receipts[0].result, '(ok true)');
    
    // Test too short duration
    block = chain.mineBlock([
      Tx.contractCall('zen-session', 'start-session', 
        [types.uint(3)], 
        wallet1.address)
    ]);
    assertEquals(block.receipts[0].result, '(err u100)');
    
    // Test too long duration
    block = chain.mineBlock([
      Tx.contractCall('zen-session', 'start-session', 
        [types.uint(200)], 
        wallet1.address)
    ]);
    assertEquals(block.receipts[0].result, '(err u101)');
  },
});
